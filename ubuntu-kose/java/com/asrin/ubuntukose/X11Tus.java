package com.asrin.ubuntukose;

import android.accessibilityservice.AccessibilityService;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

/**
 * Termux:X11 öndeyken sağ üstte yüzen menü tuşu (erişilebilirlik katmanı, izin gerektirmez).
 * KoseServis.onAccessibilityEvent her uygulama değişiminde olay()'ı çağırır.
 * Dokun: menü. Sürükle: yerini değiştir.
 */
public class X11Tus {
    static final String X11 = "com.termux.x11";
    static final int TYPE_ACCESSIBILITY_OVERLAY = 2032;
    static final int TURUNCU = 0xFFE95420, GRI = 0xFF3A3A3C;

    static AccessibilityService srv;
    static WindowManager wm;
    static Handler h;
    static SharedPreferences sp;
    static View tus, menu;
    static WindowManager.LayoutParams tp, mp;
    static boolean gizli;

    // ------------------------------------------------------------------ servis kancaları
    public static void olay(AccessibilityService s, String paket) {
        try {
            if (srv != s) {
                kaldir();
                srv = s;
                wm = (WindowManager) s.getSystemService(Context.WINDOW_SERVICE);
                h = new Handler(Looper.getMainLooper());
                sp = s.getSharedPreferences("x11tus", 0);
            }
            if (X11.equals(paket)) goster();
            else if (paket != null && !paket.equals(s.getPackageName()) && !paket.startsWith("com.android.systemui")) {
                gizli = false;
                kaldirGorunum();
            }
        } catch (Throwable t) { }
    }

    public static void kaldir() {
        try { kaldirGorunum(); } catch (Throwable t) { }
        srv = null;
    }

    static void kaldirGorunum() {
        menuKapat();
        if (tus != null) { try { wm.removeView(tus); } catch (Throwable t) { } tus = null; }
    }

    // ------------------------------------------------------------------ yardımcılar
    static int dp(float v) {
        return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v, srv.getResources().getDisplayMetrics());
    }

    static WindowManager.LayoutParams katman(int w, int hh, int ekBayrak) {
        WindowManager.LayoutParams p = new WindowManager.LayoutParams(w, hh, TYPE_ACCESSIBILITY_OVERLAY,
                WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE | WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN
                        | WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS | ekBayrak, -3 /* TRANSLUCENT */);
        p.gravity = Gravity.TOP | Gravity.RIGHT;
        try { WindowManager.LayoutParams.class.getField("layoutInDisplayCutoutMode").setInt(p, 1); } catch (Throwable t) { }
        return p;
    }

    /** Termux'ta arka planda bash -c komut çalıştırır (allow-external-apps kurulumda açılıyor). */
    static void termux(String komut) {
        Intent i = new Intent("com.termux.RUN_COMMAND");
        i.setClassName("com.termux", "com.termux.app.RunCommandService");
        i.putExtra("com.termux.RUN_COMMAND_PATH", "/data/data/com.termux/files/usr/bin/bash");
        i.putExtra("com.termux.RUN_COMMAND_ARGUMENTS", new String[]{"-c", komut});
        i.putExtra("com.termux.RUN_COMMAND_WORKDIR", "/data/data/com.termux/files/home");
        i.putExtra("com.termux.RUN_COMMAND_BACKGROUND", true);
        try {
            Context.class.getMethod("startForegroundService", Intent.class).invoke(srv, i);
        } catch (Throwable t) {
            Toast.makeText(srv, "Termux'a ulaşılamadı", Toast.LENGTH_SHORT).show();
        }
    }

    /** Açık masaüstünün (ubuntu ya da raspi) içinde komut çalıştırır. */
    static void masaustunde(String komut) {
        termux("d=ubuntu; [ \"$(cat ~/.kose-masaustu 2>/dev/null)\" = raspi ] && d=$(cat ~/.kose-raspi-ad 2>/dev/null || echo raspi); "
                + "proot-distro login $d --shared-tmp -- env DISPLAY=:0 bash -c '" + komut + "'");
    }

    static void x11Ayar(String anahtar, String deger) {
        Intent i = new Intent("com.termux.x11.CHANGE_PREFERENCE");
        i.setPackage(X11);
        i.putExtra(anahtar, deger);
        srv.sendBroadcast(i);
    }

    // ------------------------------------------------------------------ eylemler
    static void klavye() {
        // Termux:X11'in "geri tuşu" eylemi varsayılan olarak telefonun klavyesini açar/kapatır
        Intent i = new Intent("com.termux.x11.ACTION_CUSTOM");
        i.setPackage(X11);
        i.putExtra("what", "backButton");
        srv.sendBroadcast(i);
    }

    static final String[] MOD_AD = {"fare", "tikla", "dokunmatik"};

    static void mod(int m) {   // 1 fare (trackpad), 2 tıkla seç, 3 dokunmatik
        sp.edit().putInt("mod", m).apply();
        x11Ayar("touchMode", String.valueOf(m));
        String a = MOD_AD[m - 1];
        termux("echo " + a + " > ~/.kose-dokunma; echo " + a + " > \"$TMPDIR/kose-dokunma\"");
        Toast.makeText(srv, new String[]{"Fare (trackpad)", "Tıkla seç", "Dokunmatik"}[m - 1], Toast.LENGTH_SHORT).show();
    }

    static void tusa(String k) {
        masaustunde("command -v xdotool >/dev/null || DEBIAN_FRONTEND=noninteractive apt-get install -y xdotool >/dev/null 2>&1; "
                + "xdotool key --clearmodifiers " + k);
    }

    static void sistem(String s) {
        sp.edit().putString("sistem", s).apply();
        termux("echo " + s + " > ~/.kose-masaustu; if pgrep -f 'com.termux.x11 :0' >/dev/null; then echo " + s
                + " > \"$TMPDIR/kose-gecis\"; pkill -x xfce4-session; pkill -x lxsession; fi");
        Toast.makeText(srv, s.equals("raspi") ? "Raspberry Pi OS açılıyor…" : "Ubuntu XFCE açılıyor…", Toast.LENGTH_SHORT).show();
    }

    static void x11Ayarlari() {
        try {
            Intent i = new Intent(Intent.ACTION_MAIN);
            i.setClassName(X11, "com.termux.x11.LoriePreferences");
            i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            srv.startActivity(i);
        } catch (Throwable t) {
            Toast.makeText(srv, "Termux:X11 ayarları açılamadı", Toast.LENGTH_SHORT).show();
        }
    }

    static void kapat() {
        Intent i = new Intent("com.termux.x11.ACTION_STOP");
        i.setPackage(X11);
        srv.sendBroadcast(i);
        termux("pkill -f 'com.termux.x11 :0'");
        kaldirGorunum();
    }

    // ------------------------------------------------------------------ yüzen tuş
    static void goster() {
        if (gizli || tus != null) return;
        tus = new TusGorunum(srv);
        tp = katman(dp(42), dp(42), 0);
        tp.x = sp.getInt("x", dp(12));
        tp.y = sp.getInt("y", dp(12));
        try { wm.addView(tus, tp); } catch (Throwable t) { tus = null; }
    }

    static class TusGorunum extends View {
        final Paint dolgu = new Paint(Paint.ANTI_ALIAS_FLAG), kenar = new Paint(Paint.ANTI_ALIAS_FLAG), cizgi = new Paint(Paint.ANTI_ALIAS_FLAG);
        float ix, iy; int bx, by; boolean surukle;

        TusGorunum(Context c) {
            super(c);
            dolgu.setColor(0xC8202124);
            kenar.setColor(0x66FFFFFF); kenar.setStyle(Paint.Style.STROKE); kenar.setStrokeWidth(dp(1.2f));
            cizgi.setColor(0xFFFFFFFF); cizgi.setStrokeWidth(dp(2.2f)); cizgi.setStrokeCap(Paint.Cap.ROUND);
        }

        @Override protected void onDraw(Canvas c) {
            float w = getWidth(), r = w / 2f - dp(1.5f);
            c.drawCircle(w / 2f, w / 2f, r, dolgu);
            c.drawCircle(w / 2f, w / 2f, r, kenar);
            float x0 = w * 0.32f, x1 = w * 0.68f;
            for (int i = -1; i <= 1; i++) { float y = w / 2f + i * w * 0.14f; c.drawLine(x0, y, x1, y, cizgi); }
        }

        @Override public boolean onTouchEvent(MotionEvent e) {
            switch (e.getAction()) {
                case MotionEvent.ACTION_DOWN:
                    ix = e.getRawX(); iy = e.getRawY(); bx = tp.x; by = tp.y; surukle = false;
                    setAlpha(0.7f); return true;
                case MotionEvent.ACTION_MOVE:
                    float dx = e.getRawX() - ix, dy = e.getRawY() - iy;
                    if (!surukle && Math.abs(dx) + Math.abs(dy) > dp(8)) { surukle = true; menuKapat(); }
                    if (surukle) {
                        tp.x = Math.max(0, bx - (int) dx); tp.y = Math.max(0, by + (int) dy);
                        try { wm.updateViewLayout(this, tp); } catch (Throwable t) { }
                    }
                    return true;
                case MotionEvent.ACTION_UP:
                    setAlpha(1f);
                    if (surukle) sp.edit().putInt("x", tp.x).putInt("y", tp.y).apply();
                    else if (menu != null) menuKapat(); else menuAc();
                    return true;
                case MotionEvent.ACTION_CANCEL:
                    setAlpha(1f); return true;
            }
            return false;
        }
    }

    // ------------------------------------------------------------------ menü
    interface Eylem { void yap(); }

    static TextView cip(String ad, boolean secili, final boolean kapatsin, final Eylem e) {
        TextView t = new TextView(srv);
        t.setText(ad);
        t.setTextColor(0xFFFFFFFF);
        t.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        t.setPadding(dp(13), dp(9), dp(13), dp(9));
        GradientDrawable g = new GradientDrawable();
        g.setColor(secili ? TURUNCU : GRI);
        g.setCornerRadius(dp(16));
        t.setBackgroundDrawable(g);
        t.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                if (kapatsin) menuKapat();
                try { e.yap(); } catch (Throwable x) { Toast.makeText(srv, "Olmadı: " + x.getMessage(), Toast.LENGTH_SHORT).show(); }
            }
        });
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.setMargins(dp(3), dp(3), dp(3), dp(3));
        t.setLayoutParams(lp);
        return t;
    }

    static void bolum(LinearLayout kok, String baslik, View... cipler) {
        if (baslik != null) {
            TextView b = new TextView(srv);
            b.setText(baslik);
            b.setTextColor(0xFFA0A0A5);
            b.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
            b.setPadding(dp(6), dp(8), dp(6), dp(1));
            kok.addView(b);
        }
        LinearLayout satir = new LinearLayout(srv);
        satir.setOrientation(LinearLayout.HORIZONTAL);
        for (View c : cipler) satir.addView(c);
        kok.addView(satir);
    }

    static void menuAc() {
        int m = sp.getInt("mod", 2);
        String s = sp.getString("sistem", "xfce");
        LinearLayout kok = new LinearLayout(srv);
        kok.setOrientation(LinearLayout.VERTICAL);
        kok.setPadding(dp(8), dp(6), dp(8), dp(8));

        bolum(kok, null,
                cip("⌨  Klavye", false, true, new Eylem() { public void yap() { klavye(); } }),
                cip("⚙  Termux:X11 ayarları", false, true, new Eylem() { public void yap() { x11Ayarlari(); } }));
        bolum(kok, "DOKUNMA",
                cip("Fare (trackpad)", m == 1, true, new Eylem() { public void yap() { mod(1); } }),
                cip("Tıkla seç", m == 2, true, new Eylem() { public void yap() { mod(2); } }),
                cip("Dokunmatik", m == 3, true, new Eylem() { public void yap() { mod(3); } }));
        bolum(kok, "METİN",
                cip("Tümünü seç", false, false, new Eylem() { public void yap() { tusa("ctrl+a"); } }),
                cip("Kopyala", false, false, new Eylem() { public void yap() { tusa("ctrl+c"); } }),
                cip("Yapıştır", false, false, new Eylem() { public void yap() { tusa("ctrl+v"); } }),
                cip("Kes", false, false, new Eylem() { public void yap() { tusa("ctrl+x"); } }));
        bolum(kok, "SİSTEM",
                cip("Ubuntu XFCE", s.equals("xfce"), true, new Eylem() { public void yap() { sistem("xfce"); } }),
                cip("Raspberry Pi OS", s.equals("raspi"), true, new Eylem() { public void yap() { sistem("raspi"); } }));
        bolum(kok, null,
                cip("Köşe Ayarları", false, true, new Eylem() { public void yap() { masaustunde("command -v kose-ayarlar >/dev/null && kose-ayarlar"); } }),
                cip("Tuşu gizle", false, true, new Eylem() { public void yap() { gizli = true; kaldirGorunum();
                    Toast.makeText(srv, "Termux:X11'i yeniden açınca tuş geri gelir", Toast.LENGTH_SHORT).show(); } }),
                cip("Kapat", false, true, new Eylem() { public void yap() { kapat(); } }));

        ScrollView sv = new ScrollView(srv) {
            @Override public boolean onTouchEvent(MotionEvent e) {
                if (e.getAction() == MotionEvent.ACTION_OUTSIDE) { menuKapat(); return true; }
                return super.onTouchEvent(e);
            }
        };
        GradientDrawable g = new GradientDrawable();
        g.setColor(0xF2202124);
        g.setCornerRadius(dp(20));
        g.setStroke(dp(1), 0x33FFFFFF);
        sv.setBackgroundDrawable(g);
        sv.addView(kok);

        DisplayMetrics dm = srv.getResources().getDisplayMetrics();
        kok.measure(View.MeasureSpec.makeMeasureSpec(dm.widthPixels, View.MeasureSpec.AT_MOST), View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
        int y = tp.y + dp(48), enfazla = dm.heightPixels - y - dp(8);
        if (enfazla < dp(160)) { y = dp(8); enfazla = dm.heightPixels - dp(16); }
        mp = katman(ViewGroup.LayoutParams.WRAP_CONTENT, kok.getMeasuredHeight() > enfazla ? enfazla : ViewGroup.LayoutParams.WRAP_CONTENT,
                WindowManager.LayoutParams.FLAG_WATCH_OUTSIDE_TOUCH);
        mp.x = tp.x;
        mp.y = y;
        menu = sv;
        try { wm.addView(menu, mp); } catch (Throwable t) { menu = null; }
    }

    static void menuKapat() {
        if (menu != null) { try { wm.removeView(menu); } catch (Throwable t) { } menu = null; }
    }
}

.class public Lcom/asrin/ubuntukose/KoseServis;
.super Landroid/accessibilityservice/AccessibilityService;
.source "KoseServis.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/asrin/ubuntukose/KoseServis$Tutamak;,
        Lcom/asrin/ubuntukose/KoseServis$Perde;
    }
.end annotation


# static fields
.field static final ANDROID:I = 0x1

.field static final BB:I = 0xf

.field static final DECK:I = 0xe

.field static final GB:I = 0xb

.field static final IOS:I = 0x2

.field static final IOS6:I = 0x3

.field static final IPOD:I = 0x5

.field static final JARVIS:I = 0x10

.field static final KOSELER:[[Ljava/lang/String;

.field static final NOKIA:I = 0x6

.field static final NOTHING:I = 0x4

.field static final OS_AD:[Ljava/lang/String;

.field static final OS_GORUNEN:[Ljava/lang/String;

.field static final OS_RENK:[I

.field static final PREF:Ljava/lang/String; = "kose"

.field static final PSP:I = 0x9

.field static final SAAT:I = 0xa

.field static final SADE:I = 0x7

.field static final SWITCH:I = 0xd

.field static final UBUNTU:I = 0x0

.field static final WII:I = 0xc

.field static final WP:I = 0x8

.field static final X11:Ljava/lang/String; = "com.termux.x11"

.field static final XP:I = 0x11

.field static calisan:Lcom/asrin/ubuntukose/KoseServis;


# instance fields
.field altSag:Lcom/asrin/ubuntukose/KoseServis$Tutamak;

.field altSol:Lcom/asrin/ubuntukose/KoseServis$Tutamak;

.field arka:Lcom/asrin/ubuntukose/Arkaplan;

.field arkaDokun:Lcom/asrin/ubuntukose/ArkaDokun;

.field final ekranAlici:Landroid/content/BroadcastReceiver;

.field fenerAcik:Z

.field final h:Landroid/os/Handler;

.field launcher:Ljava/lang/String;

.field onPaket:Ljava/lang/String;

.field perde:Lcom/asrin/ubuntukose/KoseServis$Perde;

.field final prefDinle:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

.field final renkTek:Ljava/lang/Runnable;

.field sag:Lcom/asrin/ubuntukose/KoseServis$Tutamak;

.field secici:Landroid/view/View;

.field sol:Lcom/asrin/ubuntukose/KoseServis$Tutamak;

.field sp:Landroid/content/SharedPreferences;

.field wm:Landroid/view/WindowManager;

.field yardimci:Lcom/asrin/ubuntukose/AssistiveTouch;


# direct methods
.method public static synthetic $r8$lambda$BWJJgLkYl1i_cjaETg9XFfLd21g(Lcom/asrin/ubuntukose/KoseServis;)V
    .locals 0

    invoke-direct {p0}, Lcom/asrin/ubuntukose/KoseServis;->lambda$yardimcilariKur$2()V

    return-void
.end method

.method public static synthetic $r8$lambda$MTb-6lwFQnfokMFip75mwcjIWNs(Lcom/asrin/ubuntukose/KoseServis;ILjava/lang/String;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/asrin/ubuntukose/KoseServis;->lambda$seciciAc$9(ILjava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$NnVTLR1fQRbN18EH1FYUx7r08pA(Lcom/asrin/ubuntukose/KoseServis;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/asrin/ubuntukose/KoseServis;->lambda$seciciKapat$10(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$QhBT2Cbk1gQueYvbyUPZ86ZXEDM(Lcom/asrin/ubuntukose/KoseServis;Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/asrin/ubuntukose/KoseServis;->lambda$new$1(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic $r8$lambda$fBk9ERTKx1S4ZL4-mDgJTzWUkoM(Lcom/asrin/ubuntukose/KoseServis;)V
    .locals 0

    invoke-direct {p0}, Lcom/asrin/ubuntukose/KoseServis;->lambda$new$0()V

    return-void
.end method

.method public static synthetic $r8$lambda$iuSGpgBmjTY4OqFvHxkpGd_1LCc(Lcom/asrin/ubuntukose/KoseServis;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/asrin/ubuntukose/KoseServis;->lambda$seciciAc$7(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$pdo-XApCKLfTH6V1iRtOtBX8mjg(Lcom/asrin/ubuntukose/KoseServis;)V
    .locals 0

    invoke-direct {p0}, Lcom/asrin/ubuntukose/KoseServis;->lambda$eylem$3()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 25

    .line 56
    const/16 v0, 0x12

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "ubuntu"

    aput-object v3, v1, v2

    const-string v4, "android"

    const/4 v5, 0x1

    aput-object v4, v1, v5

    const/4 v4, 0x2

    const-string v6, "ios"

    aput-object v6, v1, v4

    const-string v7, "ios6"

    const/4 v8, 0x3

    aput-object v7, v1, v8

    const-string v7, "nothing"

    const/4 v9, 0x4

    aput-object v7, v1, v9

    const/4 v7, 0x5

    const-string v10, "ipod"

    aput-object v10, v1, v7

    const-string v11, "nokia"

    const/4 v12, 0x6

    aput-object v11, v1, v12

    const/4 v11, 0x7

    const-string v13, "sade"

    aput-object v13, v1, v11

    const-string v14, "wp"

    const/16 v15, 0x8

    aput-object v14, v1, v15

    const-string v14, "psp"

    const/16 v16, 0x9

    aput-object v14, v1, v16

    const-string v14, "saat"

    const/16 v17, 0xa

    aput-object v14, v1, v17

    const-string v14, "gb"

    const/16 v18, 0xb

    aput-object v14, v1, v18

    const-string v14, "wii"

    const/16 v19, 0xc

    aput-object v14, v1, v19

    const-string v14, "switch"

    const/16 v20, 0xd

    aput-object v14, v1, v20

    const-string v14, "deck"

    const/16 v21, 0xe

    aput-object v14, v1, v21

    const-string v14, "bb"

    const/16 v22, 0xf

    aput-object v14, v1, v22

    const-string v14, "jarvis"

    const/16 v23, 0x10

    aput-object v14, v1, v23

    const/16 v14, 0x11

    const-string v24, "xp"

    aput-object v24, v1, v14

    sput-object v1, Lcom/asrin/ubuntukose/KoseServis;->OS_AD:[Ljava/lang/String;

    .line 57
    new-array v1, v0, [Ljava/lang/String;

    const-string v14, "Ubuntu"

    aput-object v14, v1, v2

    const-string v14, "Android"

    aput-object v14, v1, v5

    const-string v14, "iOS 26"

    aput-object v14, v1, v4

    const-string v14, "iOS 6"

    aput-object v14, v1, v8

    const-string v14, "Nothing OS"

    aput-object v14, v1, v9

    const-string v14, "iPod"

    aput-object v14, v1, v7

    const-string v7, "Nokia"

    aput-object v7, v1, v12

    const-string v7, "Sade"

    aput-object v7, v1, v11

    const-string v7, "Windows Phone"

    aput-object v7, v1, v15

    const-string v7, "PSP"

    aput-object v7, v1, v16

    const-string v7, "watchOS"

    aput-object v7, v1, v17

    const-string v7, "Game Boy"

    aput-object v7, v1, v18

    const-string v7, "Wii"

    aput-object v7, v1, v19

    const-string v7, "Switch"

    aput-object v7, v1, v20

    const-string v7, "Steam Deck"

    aput-object v7, v1, v21

    const-string v7, "BlackBerry"

    aput-object v7, v1, v22

    const-string v7, "JARVIS"

    aput-object v7, v1, v23

    const/16 v7, 0x11

    const-string v11, "Windows XP"

    aput-object v11, v1, v7

    sput-object v1, Lcom/asrin/ubuntukose/KoseServis;->OS_GORUNEN:[Ljava/lang/String;

    .line 60
    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/asrin/ubuntukose/KoseServis;->OS_RENK:[I

    .line 65
    new-array v0, v9, [[Ljava/lang/String;

    new-array v1, v4, [Ljava/lang/String;

    const-string v7, "sol"

    aput-object v7, v1, v2

    aput-object v3, v1, v5

    aput-object v1, v0, v2

    new-array v1, v4, [Ljava/lang/String;

    const-string v3, "sag"

    aput-object v3, v1, v2

    aput-object v6, v1, v5

    aput-object v1, v0, v5

    new-array v1, v4, [Ljava/lang/String;

    const-string v3, "altSol"

    aput-object v3, v1, v2

    aput-object v13, v1, v5

    aput-object v1, v0, v4

    new-array v1, v4, [Ljava/lang/String;

    const-string v3, "altSag"

    aput-object v3, v1, v2

    aput-object v10, v1, v5

    aput-object v1, v0, v8

    sput-object v0, Lcom/asrin/ubuntukose/KoseServis;->KOSELER:[[Ljava/lang/String;

    return-void

    :array_0
    .array-data 4
        -0x16abe0
        -0xc2237c
        -0x825801
        -0x704a18
        -0x28e6df
        -0x171714
        -0xd59025
        -0x463b50
        -0xe45e1e
        -0x827018
        -0xc8a1
        -0x7453f1
        -0xcb4113
        -0x19ffee
        -0xe56001
        -0xa59174
        -0xff1a01
        -0xc365d1
    .end array-data
.end method

.method public constructor <init>()V
    .locals 2

    .line 50
    invoke-direct {p0}, Landroid/accessibilityservice/AccessibilityService;-><init>()V

    .line 83
    const-string v0, ""

    iput-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->onPaket:Ljava/lang/String;

    iput-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->launcher:Ljava/lang/String;

    .line 84
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->h:Landroid/os/Handler;

    .line 88
    new-instance v0, Lcom/asrin/ubuntukose/KoseServis$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/asrin/ubuntukose/KoseServis$$ExternalSyntheticLambda0;-><init>(Lcom/asrin/ubuntukose/KoseServis;)V

    iput-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->prefDinle:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    .line 251
    new-instance v0, Lcom/asrin/ubuntukose/KoseServis$2;

    invoke-direct {v0, p0}, Lcom/asrin/ubuntukose/KoseServis$2;-><init>(Lcom/asrin/ubuntukose/KoseServis;)V

    iput-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->ekranAlici:Landroid/content/BroadcastReceiver;

    .line 381
    new-instance v0, Lcom/asrin/ubuntukose/KoseServis$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0}, Lcom/asrin/ubuntukose/KoseServis$$ExternalSyntheticLambda4;-><init>(Lcom/asrin/ubuntukose/KoseServis;)V

    iput-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->renkTek:Ljava/lang/Runnable;

    return-void
.end method

.method static iosModuAyarla(Landroid/content/Context;Z)V
    .locals 3
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "acik"    # Z

    .line 305
    const-string v0, "kose"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "iosModu"

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 306
    if-eqz p1, :cond_0

    invoke-static {p0, v1}, Lcom/asrin/ubuntukose/IosActivity;->ac(Landroid/content/Context;Z)V

    goto :goto_0

    .line 307
    :cond_0
    invoke-static {}, Lcom/asrin/ubuntukose/IosActivity;->kapat()V

    .line 308
    :goto_0
    return-void
.end method

.method static kabukMu(I)Z
    .locals 1
    .param p0, "os"    # I

    .line 63
    const/4 v0, 0x2

    if-lt p0, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private synthetic lambda$eylem$3()V
    .locals 1

    .line 138
    const/16 v0, 0x9

    invoke-virtual {p0, v0}, Lcom/asrin/ubuntukose/KoseServis;->performGlobalAction(I)Z

    return-void
.end method

.method static synthetic lambda$eylem$4()V
    .locals 1

    .line 149
    const-string v0, "window.Siri && Siri.ac()"

    invoke-static {v0}, Lcom/asrin/ubuntukose/IosActivity;->js(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$eylem$5()V
    .locals 1

    .line 167
    const-string v0, "typeof Pencere !== \'undefined\' && Pencere.ac(\'sys:kamera\')"

    invoke-static {v0}, Lcom/asrin/ubuntukose/IosActivity;->js(Ljava/lang/String;)V

    return-void
.end method

.method private synthetic lambda$new$0()V
    .locals 0

    .line 90
    invoke-virtual {p0}, Lcom/asrin/ubuntukose/KoseServis;->tutamaklariKur()V

    invoke-virtual {p0}, Lcom/asrin/ubuntukose/KoseServis;->yardimcilariKur()V

    return-void
.end method

.method private synthetic lambda$new$1(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Landroid/content/SharedPreferences;
    .param p2, "k"    # Ljava/lang/String;

    .line 89
    const-string v0, "atX"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "atY"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 90
    :cond_0
    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->h:Landroid/os/Handler;

    new-instance v1, Lcom/asrin/ubuntukose/KoseServis$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0}, Lcom/asrin/ubuntukose/KoseServis$$ExternalSyntheticLambda5;-><init>(Lcom/asrin/ubuntukose/KoseServis;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 91
    return-void

    .line 89
    :cond_1
    :goto_0
    return-void
.end method

.method static synthetic lambda$onAccessibilityEvent$6(Ljava/lang/String;)V
    .locals 2
    .param p0, "paket"    # Ljava/lang/String;

    .line 225
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "window.Sade && Sade.engellendi(\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\')"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/asrin/ubuntukose/IosActivity;->js(Ljava/lang/String;)V

    return-void
.end method

.method private synthetic lambda$seciciAc$7(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .line 320
    invoke-virtual {p0}, Lcom/asrin/ubuntukose/KoseServis;->seciciKapat()V

    return-void
.end method

.method static synthetic lambda$seciciAc$8(Landroid/view/View;)V
    .locals 0
    .param p0, "v"    # Landroid/view/View;

    .line 327
    return-void
.end method

.method private synthetic lambda$seciciAc$9(ILjava/lang/String;Landroid/view/View;)V
    .locals 1
    .param p1, "os"    # I
    .param p2, "su"    # Ljava/lang/String;
    .param p3, "v"    # Landroid/view/View;

    .line 341
    invoke-virtual {p0}, Lcom/asrin/ubuntukose/KoseServis;->seciciKapat()V

    sget-object v0, Lcom/asrin/ubuntukose/KoseServis;->OS_AD:[Ljava/lang/String;

    aget-object v0, v0, p1

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/asrin/ubuntukose/KoseServis;->sistemeGec(I)V

    :cond_0
    return-void
.end method

.method private synthetic lambda$seciciKapat$10(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .line 356
    :try_start_0
    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->wm:Landroid/view/WindowManager;

    invoke-interface {v0, p1}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :goto_0
    return-void
.end method

.method private synthetic lambda$yardimcilariKur$2()V
    .locals 3

    .line 124
    const-class v0, Landroid/os/Vibrator;

    invoke-virtual {p0, v0}, Lcom/asrin/ubuntukose/KoseServis;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    const/4 v1, 0x1

    invoke-static {v1}, Landroid/os/VibrationEffect;->createPredefined(I)Landroid/os/VibrationEffect;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Vibrator;->vibrate(Landroid/os/VibrationEffect;)V

    .line 125
    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->sp:Landroid/content/SharedPreferences;

    const-string v1, "arkaDokun"

    const-string v2, "yok"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/asrin/ubuntukose/KoseServis;->eylem(Ljava/lang/String;)V

    .line 126
    return-void
.end method

.method static osNo(Ljava/lang/String;)I
    .locals 2
    .param p0, "s"    # Ljava/lang/String;

    .line 62
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lcom/asrin/ubuntukose/KoseServis;->OS_AD:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_1

    sget-object v1, Lcom/asrin/ubuntukose/KoseServis;->OS_AD:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .end local v0    # "i":I
    :cond_1
    const/4 v0, 0x2

    return v0
.end method

.method static sadeEngelli(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 5
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "paket"    # Ljava/lang/String;

    .line 211
    const-string v0, "kose"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 212
    .local v0, "k":Landroid/content/SharedPreferences;
    const-string v2, "iosModu"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v2, "stil"

    const-string v3, "ios"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "sade"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v2, "sadeEngelAcik"

    const-string v3, "1"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    .line 213
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "sadeEngel"

    const-string v4, ""

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    return v1

    .line 212
    :cond_1
    :goto_0
    return v1
.end method

.method static stil(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p0, "c"    # Landroid/content/Context;

    .line 66
    const-string v0, "kose"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "stil"

    const-string v2, "ios"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static stilAyarla(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "s"    # Ljava/lang/String;

    .line 71
    const-string v0, "kose"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "stil"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "window.Kabuk && Kabuk.stil && Kabuk.stil(\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\')"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/asrin/ubuntukose/IosActivity;->js(Ljava/lang/String;)V

    .line 73
    return-void
.end method

.method static ubuntuyuAc(Landroid/content/Context;)V
    .locals 5
    .param p0, "c"    # Landroid/content/Context;

    .line 283
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.termux.RUN_COMMAND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 284
    .local v0, "i":Landroid/content/Intent;
    const-string v1, "com.termux"

    const-string v2, "com.termux.app.RunCommandService"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 285
    const-string v1, "com.termux.RUN_COMMAND_PATH"

    const-string v2, "/data/data/com.termux/files/usr/bin/bash"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 286
    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "/data/data/com.termux/files/home/ubuntu-baslat.sh"

    aput-object v4, v2, v3

    const-string v3, "com.termux.RUN_COMMAND_ARGUMENTS"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 287
    const-string v2, "com.termux.RUN_COMMAND_WORKDIR"

    const-string v3, "/data/data/com.termux/files/home"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 288
    const-string v2, "com.termux.RUN_COMMAND_BACKGROUND"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 290
    :try_start_0
    invoke-virtual {p0, v0}, Landroid/content/Context;->startForegroundService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 295
    nop

    .line 297
    :try_start_1
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    const-string v3, "com.termux.x11"

    const-string v4, "com.termux.x11.MainActivity"

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    .line 298
    const/high16 v3, 0x10000000

    invoke-virtual {v2, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v2

    .line 297
    invoke-virtual {p0, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 301
    goto :goto_0

    .line 299
    :catch_0
    move-exception v2

    .line 300
    .local v2, "e":Ljava/lang/Exception;
    const-string v3, "Termux:X11 kurulu de\u011fil"

    invoke-static {p0, v3, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 302
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_0
    return-void

    .line 291
    :catch_1
    move-exception v2

    .line 292
    .restart local v2    # "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Termux\'a ula\u015f\u0131lamad\u0131: K\u00f6\u015fe uygulamas\u0131n\u0131 a\u00e7\u0131p ad\u0131mlar\u0131 tamamla\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    .line 293
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 294
    return-void
.end method


# virtual methods
.method aktiviteMi(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3
    .param p1, "paket"    # Ljava/lang/String;
    .param p2, "sinif"    # Ljava/lang/String;

    .line 238
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Lcom/asrin/ubuntukose/KoseServis;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    new-instance v2, Landroid/content/ComponentName;

    invoke-direct {v2, p1, p2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2, v0}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x1

    return v0

    .line 239
    :catch_0
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    return v0
.end method

.method dp(F)I
    .locals 1
    .param p1, "v"    # F

    .line 402
    invoke-virtual {p0}, Lcom/asrin/ubuntukose/KoseServis;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method

.method eylem(Ljava/lang/String;)V
    .locals 12
    .param p1, "ne"    # Ljava/lang/String;

    .line 134
    sget-boolean v0, Lcom/asrin/ubuntukose/IosActivity;->onde:Z

    .line 135
    .local v0, "ios":Z
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/16 v2, 0x8

    const/4 v3, 0x4

    const/4 v4, 0x3

    const/4 v5, 0x5

    const/4 v6, 0x2

    const/4 v7, 0x1

    const/4 v8, 0x0

    sparse-switch v1, :sswitch_data_0

    :cond_0
    goto/16 :goto_0

    :sswitch_0
    const-string v1, "bildirim"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v6

    goto/16 :goto_1

    :sswitch_1
    const-string v1, "ekranGoruntusu"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v8

    goto/16 :goto_1

    :sswitch_2
    const-string v1, "kilit"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v7

    goto/16 :goto_1

    :sswitch_3
    const-string v1, "fener"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0x9

    goto :goto_1

    :sswitch_4
    const-string v1, "siri"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v2

    goto :goto_1

    :sswitch_5
    const-string v1, "geri"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v3

    goto :goto_1

    :sswitch_6
    const-string v1, "ana"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x7

    goto :goto_1

    :sswitch_7
    const-string v1, "kontrol"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v4

    goto :goto_1

    :sswitch_8
    const-string v1, "sessiz"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0xa

    goto :goto_1

    :sswitch_9
    const-string v1, "secici"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v5

    goto :goto_1

    :sswitch_a
    const-string v1, "kamera"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0xb

    goto :goto_1

    :sswitch_b
    const-string v1, "uygulamalar"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x6

    goto :goto_1

    :goto_0
    const/4 v1, -0x1

    :goto_1
    const-wide/16 v9, 0x2bc

    const/16 v11, 0x1c

    packed-switch v1, :pswitch_data_0

    goto/16 :goto_6

    .line 166
    :pswitch_0
    if-eqz v0, :cond_1

    const-string v1, "typeof Pencere !== \'undefined\' && Pencere.ac(\'sys:kamera\')"

    invoke-static {v1}, Lcom/asrin/ubuntukose/IosActivity;->js(Ljava/lang/String;)V

    goto/16 :goto_6

    .line 167
    :cond_1
    invoke-static {p0, v8}, Lcom/asrin/ubuntukose/IosActivity;->ac(Landroid/content/Context;Z)V

    iget-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->h:Landroid/os/Handler;

    new-instance v2, Lcom/asrin/ubuntukose/KoseServis$$ExternalSyntheticLambda11;

    invoke-direct {v2}, Lcom/asrin/ubuntukose/KoseServis$$ExternalSyntheticLambda11;-><init>()V

    invoke-virtual {v1, v2, v9, v10}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto/16 :goto_6

    .line 161
    :pswitch_1
    const-class v1, Landroid/media/AudioManager;

    invoke-virtual {p0, v1}, Lcom/asrin/ubuntukose/KoseServis;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/media/AudioManager;

    .line 162
    .local v1, "am":Landroid/media/AudioManager;
    :try_start_0
    invoke-virtual {v1}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v2

    if-ne v2, v6, :cond_2

    move v6, v7

    :cond_2
    invoke-virtual {v1, v6}, Landroid/media/AudioManager;->setRingerMode(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_6

    :catch_0
    move-exception v2

    .line 163
    goto/16 :goto_6

    .line 153
    .end local v1    # "am":Landroid/media/AudioManager;
    :pswitch_2
    :try_start_1
    const-class v1, Landroid/hardware/camera2/CameraManager;

    invoke-virtual {p0, v1}, Lcom/asrin/ubuntukose/KoseServis;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/camera2/CameraManager;

    .line 154
    .local v1, "cm":Landroid/hardware/camera2/CameraManager;
    invoke-virtual {v1}, Landroid/hardware/camera2/CameraManager;->getCameraIdList()[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    move v4, v8

    :goto_2
    if-ge v4, v3, :cond_5

    aget-object v5, v2, v4

    .line 155
    .local v5, "id":Ljava/lang/String;
    invoke-virtual {v1, v5}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    move-result-object v6

    sget-object v9, Landroid/hardware/camera2/CameraCharacteristics;->FLASH_INFO_AVAILABLE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v6, v9}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    .line 156
    .local v6, "f":Ljava/lang/Boolean;
    sget-object v9, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v9, v6}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    iget-boolean v2, p0, Lcom/asrin/ubuntukose/KoseServis;->fenerAcik:Z

    if-nez v2, :cond_3

    goto :goto_3

    :cond_3
    move v7, v8

    :goto_3
    invoke-virtual {v1, v5, v7}, Landroid/hardware/camera2/CameraManager;->setTorchMode(Ljava/lang/String;Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_4

    .line 154
    .end local v5    # "id":Ljava/lang/String;
    .end local v6    # "f":Ljava/lang/Boolean;
    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 158
    .end local v1    # "cm":Landroid/hardware/camera2/CameraManager;
    :cond_5
    :goto_4
    goto/16 :goto_6

    :catch_1
    move-exception v1

    .line 159
    goto/16 :goto_6

    .line 148
    :pswitch_3
    if-eqz v0, :cond_6

    const-string v1, "window.Siri && Siri.ac()"

    invoke-static {v1}, Lcom/asrin/ubuntukose/IosActivity;->js(Ljava/lang/String;)V

    goto/16 :goto_6

    .line 149
    :cond_6
    invoke-static {p0, v8}, Lcom/asrin/ubuntukose/IosActivity;->ac(Landroid/content/Context;Z)V

    iget-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->h:Landroid/os/Handler;

    new-instance v2, Lcom/asrin/ubuntukose/KoseServis$$ExternalSyntheticLambda10;

    invoke-direct {v2}, Lcom/asrin/ubuntukose/KoseServis$$ExternalSyntheticLambda10;-><init>()V

    invoke-virtual {v1, v2, v9, v10}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 150
    goto/16 :goto_6

    .line 146
    :pswitch_4
    invoke-virtual {p0}, Lcom/asrin/ubuntukose/KoseServis;->iosModu()Z

    move-result v1

    if-nez v1, :cond_8

    if-eqz v0, :cond_7

    goto :goto_5

    :cond_7
    invoke-virtual {p0, v6}, Lcom/asrin/ubuntukose/KoseServis;->performGlobalAction(I)Z

    goto :goto_6

    :cond_8
    :goto_5
    invoke-static {p0, v8}, Lcom/asrin/ubuntukose/IosActivity;->ac(Landroid/content/Context;Z)V

    goto :goto_6

    .line 145
    :pswitch_5
    if-eqz v0, :cond_9

    const-string v1, "typeof Gezgin !== \'undefined\' && Gezgin.ac()"

    invoke-static {v1}, Lcom/asrin/ubuntukose/IosActivity;->js(Ljava/lang/String;)V

    goto :goto_6

    :cond_9
    invoke-virtual {p0, v4}, Lcom/asrin/ubuntukose/KoseServis;->performGlobalAction(I)Z

    goto :goto_6

    .line 144
    :pswitch_6
    invoke-virtual {p0}, Lcom/asrin/ubuntukose/KoseServis;->seciciAc()V

    goto :goto_6

    .line 143
    :pswitch_7
    invoke-virtual {p0, v7}, Lcom/asrin/ubuntukose/KoseServis;->performGlobalAction(I)Z

    goto :goto_6

    .line 142
    :pswitch_8
    if-eqz v0, :cond_a

    const-string v1, "typeof KM !== \'undefined\' && KM.ac()"

    invoke-static {v1}, Lcom/asrin/ubuntukose/IosActivity;->js(Ljava/lang/String;)V

    goto :goto_6

    :cond_a
    invoke-virtual {p0, v5}, Lcom/asrin/ubuntukose/KoseServis;->performGlobalAction(I)Z

    goto :goto_6

    .line 141
    :pswitch_9
    if-eqz v0, :cond_b

    const-string v1, "typeof BM !== \'undefined\' && BM.ac()"

    invoke-static {v1}, Lcom/asrin/ubuntukose/IosActivity;->js(Ljava/lang/String;)V

    goto :goto_6

    :cond_b
    invoke-virtual {p0, v3}, Lcom/asrin/ubuntukose/KoseServis;->performGlobalAction(I)Z

    goto :goto_6

    .line 140
    :pswitch_a
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v11, :cond_d

    invoke-virtual {p0, v2}, Lcom/asrin/ubuntukose/KoseServis;->performGlobalAction(I)Z

    goto :goto_6

    .line 137
    :pswitch_b
    iget-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->yardimci:Lcom/asrin/ubuntukose/AssistiveTouch;

    if-eqz v1, :cond_c

    iget-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->yardimci:Lcom/asrin/ubuntukose/AssistiveTouch;

    invoke-virtual {v1}, Lcom/asrin/ubuntukose/AssistiveTouch;->gecici()V

    .line 138
    :cond_c
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v11, :cond_d

    iget-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->h:Landroid/os/Handler;

    new-instance v2, Lcom/asrin/ubuntukose/KoseServis$$ExternalSyntheticLambda9;

    invoke-direct {v2, p0}, Lcom/asrin/ubuntukose/KoseServis$$ExternalSyntheticLambda9;-><init>(Lcom/asrin/ubuntukose/KoseServis;)V

    const-wide/16 v3, 0x78

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 170
    :cond_d
    :goto_6
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        -0x5e7cdb9e -> :sswitch_b
        -0x43df77e3 -> :sswitch_a
        -0x3604d362 -> :sswitch_9
        -0x35fd671d -> :sswitch_8
        -0x2016c09b -> :sswitch_7
        0x179d4 -> :sswitch_6
        0x305b95 -> :sswitch_5
        0x35df0d -> :sswitch_4
        0x5ccf07c -> :sswitch_3
        0x6153079 -> :sswitch_2
        0x22a57a0d -> :sswitch_1
        0x349f808c -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method gec(I)V
    .locals 2
    .param p1, "hedef"    # I

    .line 371
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_0

    const/16 v0, 0xf

    invoke-virtual {p0, v0}, Lcom/asrin/ubuntukose/KoseServis;->performGlobalAction(I)Z

    .line 372
    :cond_0
    if-nez p1, :cond_1

    invoke-static {p0}, Lcom/asrin/ubuntukose/KoseServis;->ubuntuyuAc(Landroid/content/Context;)V

    goto :goto_0

    .line 373
    :cond_1
    invoke-static {p1}, Lcom/asrin/ubuntukose/KoseServis;->kabukMu(I)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object v0, Lcom/asrin/ubuntukose/KoseServis;->OS_AD:[Ljava/lang/String;

    aget-object v0, v0, p1

    invoke-static {p0, v0}, Lcom/asrin/ubuntukose/KoseServis;->stilAyarla(Landroid/content/Context;Ljava/lang/String;)V

    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/asrin/ubuntukose/KoseServis;->iosModuAyarla(Landroid/content/Context;Z)V

    goto :goto_0

    .line 375
    :cond_2
    invoke-virtual {p0}, Lcom/asrin/ubuntukose/KoseServis;->iosModu()Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/asrin/ubuntukose/KoseServis;->iosModuAyarla(Landroid/content/Context;Z)V

    .line 376
    :cond_3
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/asrin/ubuntukose/KoseServis;->performGlobalAction(I)Z

    .line 378
    :goto_0
    return-void
.end method

.method iosModu()Z
    .locals 3

    .line 207
    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->sp:Landroid/content/SharedPreferences;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->sp:Landroid/content/SharedPreferences;

    const-string v2, "iosModu"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method katman(IIZ)Landroid/view/WindowManager$LayoutParams;
    .locals 7
    .param p1, "w"    # I
    .param p2, "hh"    # I
    .param p3, "dokunulmaz"    # Z

    .line 261
    new-instance v6, Landroid/view/WindowManager$LayoutParams;

    .line 266
    if-eqz p3, :cond_0

    const/16 v0, 0x10

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    or-int/lit16 v4, v0, 0x308

    const/4 v5, -0x3

    const/16 v3, 0x7f0

    move-object v0, v6

    move v1, p1

    move v2, p2

    invoke-direct/range {v0 .. v5}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    .line 268
    .local v0, "lp":Landroid/view/WindowManager$LayoutParams;
    const v1, 0x800033

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 269
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1e

    if-lt v1, v2, :cond_1

    .line 270
    const/4 v1, 0x3

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I

    goto :goto_1

    .line 271
    :cond_1
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1c

    if-lt v1, v2, :cond_2

    .line 272
    const/4 v1, 0x1

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I

    .line 273
    :cond_2
    :goto_1
    return-object v0
.end method

.method koseOs(Lcom/asrin/ubuntukose/KoseServis$Tutamak;)I
    .locals 3
    .param p1, "t"    # Lcom/asrin/ubuntukose/KoseServis$Tutamak;

    .line 67
    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->sp:Landroid/content/SharedPreferences;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p1, Lcom/asrin/ubuntukose/KoseServis$Tutamak;->ad:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Os"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p1, Lcom/asrin/ubuntukose/KoseServis$Tutamak;->varsOs:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/asrin/ubuntukose/KoseServis;->osNo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method launcherBul()V
    .locals 3

    .line 244
    :try_start_0
    invoke-virtual {p0}, Lcom/asrin/ubuntukose/KoseServis;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.MAIN"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "android.intent.category.HOME"

    .line 245
    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    .line 244
    const/high16 v2, 0x10000

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    .line 246
    .local v0, "r":Landroid/content/pm/ResolveInfo;
    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/asrin/ubuntukose/KoseServis;->getPackageName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v2, v2, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v1, v1, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iput-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->launcher:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 247
    .end local v0    # "r":Landroid/content/pm/ResolveInfo;
    :catch_0
    move-exception v0

    :cond_0
    :goto_0
    nop

    .line 248
    return-void
.end method

.method public onAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 5
    .param p1, "e"    # Landroid/view/accessibility/AccessibilityEvent;

    .line 217
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result v0

    const/16 v1, 0x20

    if-ne v0, v1, :cond_4

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getPackageName()Ljava/lang/CharSequence;

    move-result-object v0

    if-nez v0, :cond_0

    goto/16 :goto_0

    .line 218
    :cond_0
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getPackageName()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 219
    .local v0, "paket":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getClassName()Ljava/lang/CharSequence;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getClassName()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/asrin/ubuntukose/KoseServis;->aktiviteMi(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 220
    iget-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->onPaket:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->arka:Lcom/asrin/ubuntukose/Arkaplan;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->arka:Lcom/asrin/ubuntukose/Arkaplan;

    invoke-virtual {v1, v0}, Lcom/asrin/ubuntukose/Arkaplan;->uygulama(Ljava/lang/String;)V

    .line 221
    :cond_1
    iput-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->onPaket:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/asrin/ubuntukose/X11Tus;->olay(Landroid/accessibilityservice/AccessibilityService;Ljava/lang/String;)V

    .line 222
    invoke-static {p0, v0}, Lcom/asrin/ubuntukose/KoseServis;->sadeEngelli(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 223
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lcom/asrin/ubuntukose/KoseServis;->performGlobalAction(I)Z

    .line 224
    invoke-static {p0, v2}, Lcom/asrin/ubuntukose/IosActivity;->ac(Landroid/content/Context;Z)V

    .line 225
    iget-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->h:Landroid/os/Handler;

    new-instance v2, Lcom/asrin/ubuntukose/KoseServis$$ExternalSyntheticLambda6;

    invoke-direct {v2, v0}, Lcom/asrin/ubuntukose/KoseServis$$ExternalSyntheticLambda6;-><init>(Ljava/lang/String;)V

    const-wide/16 v3, 0x1f4

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 226
    return-void

    .line 229
    :cond_2
    invoke-virtual {p0}, Lcom/asrin/ubuntukose/KoseServis;->iosModu()Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->launcher:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->perde:Lcom/asrin/ubuntukose/KoseServis$Perde;

    if-nez v1, :cond_3

    invoke-static {p0}, Lcom/asrin/ubuntukose/EvYonlendirici;->varsayilanMi(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_3

    invoke-static {p0, v2}, Lcom/asrin/ubuntukose/IosActivity;->ac(Landroid/content/Context;Z)V

    .line 231
    :cond_3
    iget-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->h:Landroid/os/Handler;

    iget-object v2, p0, Lcom/asrin/ubuntukose/KoseServis;->renkTek:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 232
    iget-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->h:Landroid/os/Handler;

    iget-object v2, p0, Lcom/asrin/ubuntukose/KoseServis;->renkTek:Ljava/lang/Runnable;

    const-wide/16 v3, 0x190

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 233
    return-void

    .line 217
    .end local v0    # "paket":Ljava/lang/String;
    :cond_4
    :goto_0
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 4
    .param p1, "c"    # Landroid/content/res/Configuration;

    .line 277
    invoke-super {p0, p1}, Landroid/accessibilityservice/AccessibilityService;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 278
    invoke-virtual {p0}, Lcom/asrin/ubuntukose/KoseServis;->tutamaklar()[Lcom/asrin/ubuntukose/KoseServis$Tutamak;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .local v3, "t":Lcom/asrin/ubuntukose/KoseServis$Tutamak;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Lcom/asrin/ubuntukose/KoseServis$Tutamak;->konumla()V

    .end local v3    # "t":Lcom/asrin/ubuntukose/KoseServis$Tutamak;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 279
    :cond_1
    return-void
.end method

.method public onInterrupt()V
    .locals 0

    .line 235
    return-void
.end method

.method protected onServiceConnected()V
    .locals 4

    .line 95
    sput-object p0, Lcom/asrin/ubuntukose/KoseServis;->calisan:Lcom/asrin/ubuntukose/KoseServis;

    .line 96
    const-class v0, Landroid/view/WindowManager;

    invoke-virtual {p0, v0}, Lcom/asrin/ubuntukose/KoseServis;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    iput-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->wm:Landroid/view/WindowManager;

    .line 97
    const-string v0, "kose"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/asrin/ubuntukose/KoseServis;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->sp:Landroid/content/SharedPreferences;

    .line 98
    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->sp:Landroid/content/SharedPreferences;

    iget-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->prefDinle:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 99
    invoke-virtual {p0}, Lcom/asrin/ubuntukose/KoseServis;->launcherBul()V

    .line 100
    invoke-virtual {p0}, Lcom/asrin/ubuntukose/KoseServis;->tutamaklariKur()V

    .line 101
    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->h:Landroid/os/Handler;

    iget-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->renkTek:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 102
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 103
    .local v0, "f":Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.SCREEN_ON"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 104
    iget-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->ekranAlici:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/asrin/ubuntukose/KoseServis;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 105
    new-instance v1, Lcom/asrin/ubuntukose/Arkaplan;

    invoke-direct {v1, p0}, Lcom/asrin/ubuntukose/Arkaplan;-><init>(Lcom/asrin/ubuntukose/KoseServis;)V

    iput-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->arka:Lcom/asrin/ubuntukose/Arkaplan;

    .line 106
    iget-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->arka:Lcom/asrin/ubuntukose/Arkaplan;

    invoke-virtual {v1}, Lcom/asrin/ubuntukose/Arkaplan;->basla()V

    .line 107
    invoke-static {p0}, Lcom/asrin/ubuntukose/Alarm;->kur(Landroid/content/Context;)V

    .line 108
    invoke-virtual {p0}, Lcom/asrin/ubuntukose/KoseServis;->yardimcilariKur()V

    .line 110
    :try_start_0
    const-class v1, Landroid/hardware/camera2/CameraManager;

    invoke-virtual {p0, v1}, Lcom/asrin/ubuntukose/KoseServis;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/camera2/CameraManager;

    new-instance v2, Lcom/asrin/ubuntukose/KoseServis$1;

    invoke-direct {v2, p0}, Lcom/asrin/ubuntukose/KoseServis$1;-><init>(Lcom/asrin/ubuntukose/KoseServis;)V

    iget-object v3, p0, Lcom/asrin/ubuntukose/KoseServis;->h:Landroid/os/Handler;

    invoke-virtual {v1, v2, v3}, Landroid/hardware/camera2/CameraManager;->registerTorchCallback(Landroid/hardware/camera2/CameraManager$TorchCallback;Landroid/os/Handler;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 113
    :catch_0
    move-exception v1

    :goto_0
    nop

    .line 114
    return-void
.end method

.method public onUnbind(Landroid/content/Intent;)Z
    .locals 5
    .param p1, "i"    # Landroid/content/Intent;

    invoke-static {}, Lcom/asrin/ubuntukose/X11Tus;->kaldir()V

    .line 173
    const/4 v0, 0x0

    sput-object v0, Lcom/asrin/ubuntukose/KoseServis;->calisan:Lcom/asrin/ubuntukose/KoseServis;

    .line 174
    iget-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->h:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 175
    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->arka:Lcom/asrin/ubuntukose/Arkaplan;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->arka:Lcom/asrin/ubuntukose/Arkaplan;

    invoke-virtual {v0}, Lcom/asrin/ubuntukose/Arkaplan;->dur()V

    .line 176
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->ekranAlici:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/asrin/ubuntukose/KoseServis;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 177
    :goto_0
    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->sp:Landroid/content/SharedPreferences;

    iget-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->prefDinle:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 178
    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->yardimci:Lcom/asrin/ubuntukose/AssistiveTouch;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->yardimci:Lcom/asrin/ubuntukose/AssistiveTouch;

    invoke-virtual {v0}, Lcom/asrin/ubuntukose/AssistiveTouch;->kaldir()V

    .line 179
    :cond_1
    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->arkaDokun:Lcom/asrin/ubuntukose/ArkaDokun;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->arkaDokun:Lcom/asrin/ubuntukose/ArkaDokun;

    invoke-virtual {v0}, Lcom/asrin/ubuntukose/ArkaDokun;->dur()V

    .line 180
    :cond_2
    invoke-virtual {p0}, Lcom/asrin/ubuntukose/KoseServis;->tutamaklar()[Lcom/asrin/ubuntukose/KoseServis$Tutamak;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v1, :cond_4

    aget-object v3, v0, v2

    .local v3, "t":Lcom/asrin/ubuntukose/KoseServis$Tutamak;
    if-eqz v3, :cond_3

    :try_start_1
    iget-object v4, p0, Lcom/asrin/ubuntukose/KoseServis;->wm:Landroid/view/WindowManager;

    invoke-interface {v4, v3}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    :catch_1
    move-exception v4

    .end local v3    # "t":Lcom/asrin/ubuntukose/KoseServis$Tutamak;
    :cond_3
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 181
    :cond_4
    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->secici:Landroid/view/View;

    if-eqz v0, :cond_5

    :try_start_2
    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->wm:Landroid/view/WindowManager;

    iget-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->secici:Landroid/view/View;

    invoke-interface {v0, v1}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_3

    :catch_2
    move-exception v0

    .line 182
    :cond_5
    :goto_3
    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->perde:Lcom/asrin/ubuntukose/KoseServis$Perde;

    if-eqz v0, :cond_6

    :try_start_3
    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->wm:Landroid/view/WindowManager;

    iget-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->perde:Lcom/asrin/ubuntukose/KoseServis$Perde;

    invoke-interface {v0, v1}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_4

    :catch_3
    move-exception v0

    .line 183
    :cond_6
    :goto_4
    invoke-super {p0, p1}, Landroid/accessibilityservice/AccessibilityService;->onUnbind(Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method

.method renkOrnekle()V
    .locals 3

    .line 385
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_2

    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->perde:Lcom/asrin/ubuntukose/KoseServis$Perde;

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->sol:Lcom/asrin/ubuntukose/KoseServis$Tutamak;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->sag:Lcom/asrin/ubuntukose/KoseServis$Tutamak;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->altSol:Lcom/asrin/ubuntukose/KoseServis$Tutamak;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->altSag:Lcom/asrin/ubuntukose/KoseServis$Tutamak;

    if-nez v0, :cond_0

    goto :goto_0

    .line 386
    :cond_0
    const-class v0, Landroid/os/PowerManager;

    invoke-virtual {p0, v0}, Lcom/asrin/ubuntukose/KoseServis;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    invoke-virtual {v0}, Landroid/os/PowerManager;->isInteractive()Z

    move-result v0

    if-nez v0, :cond_1

    return-void

    .line 387
    :cond_1
    invoke-virtual {p0}, Lcom/asrin/ubuntukose/KoseServis;->getMainExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Lcom/asrin/ubuntukose/KoseServis$3;

    invoke-direct {v1, p0}, Lcom/asrin/ubuntukose/KoseServis$3;-><init>(Lcom/asrin/ubuntukose/KoseServis;)V

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v0, v1}, Lcom/asrin/ubuntukose/KoseServis;->takeScreenshot(ILjava/util/concurrent/Executor;Landroid/accessibilityservice/AccessibilityService$TakeScreenshotCallback;)V

    .line 400
    return-void

    .line 385
    :cond_2
    :goto_0
    return-void
.end method

.method seciciAc()V
    .locals 12

    .line 316
    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->secici:Landroid/view/View;

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->wm:Landroid/view/WindowManager;

    if-nez v0, :cond_0

    goto/16 :goto_1

    .line 317
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_1

    const/16 v0, 0xf

    invoke-virtual {p0, v0}, Lcom/asrin/ubuntukose/KoseServis;->performGlobalAction(I)Z

    .line 318
    :cond_1
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 319
    .local v0, "kok":Landroid/widget/FrameLayout;
    const/high16 v1, -0x5a000000

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    .line 320
    new-instance v1, Lcom/asrin/ubuntukose/KoseServis$$ExternalSyntheticLambda12;

    invoke-direct {v1, p0}, Lcom/asrin/ubuntukose/KoseServis$$ExternalSyntheticLambda12;-><init>(Lcom/asrin/ubuntukose/KoseServis;)V

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 321
    new-instance v1, Landroid/widget/GridLayout;

    invoke-direct {v1, p0}, Landroid/widget/GridLayout;-><init>(Landroid/content/Context;)V

    .line 322
    .local v1, "g":Landroid/widget/GridLayout;
    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/widget/GridLayout;->setColumnCount(I)V

    .line 323
    const/high16 v2, 0x41400000    # 12.0f

    invoke-virtual {p0, v2}, Lcom/asrin/ubuntukose/KoseServis;->dp(F)I

    move-result v3

    const/high16 v4, 0x41800000    # 16.0f

    invoke-virtual {p0, v4}, Lcom/asrin/ubuntukose/KoseServis;->dp(F)I

    move-result v4

    invoke-virtual {p0, v2}, Lcom/asrin/ubuntukose/KoseServis;->dp(F)I

    move-result v5

    invoke-virtual {p0, v2}, Lcom/asrin/ubuntukose/KoseServis;->dp(F)I

    move-result v2

    invoke-virtual {v1, v3, v4, v5, v2}, Landroid/widget/GridLayout;->setPadding(IIII)V

    .line 324
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 325
    .local v2, "zemin":Landroid/graphics/drawable/GradientDrawable;
    const v3, -0xde3e3e2

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v3, 0x41f00000    # 30.0f

    invoke-virtual {p0, v3}, Lcom/asrin/ubuntukose/KoseServis;->dp(F)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 326
    invoke-virtual {v1, v2}, Landroid/widget/GridLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 327
    new-instance v3, Lcom/asrin/ubuntukose/KoseServis$$ExternalSyntheticLambda1;

    invoke-direct {v3}, Lcom/asrin/ubuntukose/KoseServis$$ExternalSyntheticLambda1;-><init>()V

    invoke-virtual {v1, v3}, Landroid/widget/GridLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 328
    invoke-virtual {p0}, Lcom/asrin/ubuntukose/KoseServis;->suAnki()Ljava/lang/String;

    move-result-object v3

    .line 329
    .local v3, "su":Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    sget-object v5, Lcom/asrin/ubuntukose/KoseServis;->OS_AD:[Ljava/lang/String;

    array-length v5, v5

    const/16 v6, 0x11

    const/4 v7, -0x1

    if-ge v4, v5, :cond_3

    .line 330
    move v5, v4

    .line 331
    .local v5, "os":I
    new-instance v8, Landroid/widget/TextView;

    invoke-direct {v8, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 332
    .local v8, "t":Landroid/widget/TextView;
    sget-object v9, Lcom/asrin/ubuntukose/KoseServis;->OS_GORUNEN:[Ljava/lang/String;

    aget-object v9, v9, v4

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 333
    invoke-virtual {v8, v7}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v9, 0x41480000    # 12.5f

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v8, v6}, Landroid/widget/TextView;->setGravity(I)V

    const/4 v6, 0x1

    invoke-virtual {v8, v6}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 334
    new-instance v9, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v9}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 335
    .local v9, "daire":Landroid/graphics/drawable/GradientDrawable;
    invoke-virtual {v9, v6}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 336
    sget-object v6, Lcom/asrin/ubuntukose/KoseServis;->OS_RENK:[I

    aget v6, v6, v4

    invoke-virtual {v9, v6}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v6, 0x42500000    # 52.0f

    invoke-virtual {p0, v6}, Lcom/asrin/ubuntukose/KoseServis;->dp(F)I

    move-result v10

    invoke-virtual {p0, v6}, Lcom/asrin/ubuntukose/KoseServis;->dp(F)I

    move-result v6

    invoke-virtual {v9, v10, v6}, Landroid/graphics/drawable/GradientDrawable;->setSize(II)V

    .line 337
    sget-object v6, Lcom/asrin/ubuntukose/KoseServis;->OS_AD:[Ljava/lang/String;

    aget-object v6, v6, v4

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    const/high16 v6, 0x40400000    # 3.0f

    invoke-virtual {p0, v6}, Lcom/asrin/ubuntukose/KoseServis;->dp(F)I

    move-result v6

    invoke-virtual {v9, v6, v7}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 338
    :cond_2
    const/4 v6, 0x0

    invoke-virtual {v8, v6, v9, v6, v6}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 339
    const/high16 v6, 0x40e00000    # 7.0f

    invoke-virtual {p0, v6}, Lcom/asrin/ubuntukose/KoseServis;->dp(F)I

    move-result v6

    invoke-virtual {v8, v6}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 340
    const/high16 v6, 0x40800000    # 4.0f

    invoke-virtual {p0, v6}, Lcom/asrin/ubuntukose/KoseServis;->dp(F)I

    move-result v7

    const/high16 v10, 0x41000000    # 8.0f

    invoke-virtual {p0, v10}, Lcom/asrin/ubuntukose/KoseServis;->dp(F)I

    move-result v10

    invoke-virtual {p0, v6}, Lcom/asrin/ubuntukose/KoseServis;->dp(F)I

    move-result v6

    const/high16 v11, 0x41200000    # 10.0f

    invoke-virtual {p0, v11}, Lcom/asrin/ubuntukose/KoseServis;->dp(F)I

    move-result v11

    invoke-virtual {v8, v7, v10, v6, v11}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 341
    new-instance v6, Lcom/asrin/ubuntukose/KoseServis$$ExternalSyntheticLambda2;

    invoke-direct {v6, p0, v5, v3}, Lcom/asrin/ubuntukose/KoseServis$$ExternalSyntheticLambda2;-><init>(Lcom/asrin/ubuntukose/KoseServis;ILjava/lang/String;)V

    invoke-virtual {v8, v6}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 342
    new-instance v6, Landroid/widget/GridLayout$LayoutParams;

    invoke-direct {v6}, Landroid/widget/GridLayout$LayoutParams;-><init>()V

    .line 343
    .local v6, "lp":Landroid/widget/GridLayout$LayoutParams;
    const/high16 v7, 0x42c40000    # 98.0f

    invoke-virtual {p0, v7}, Lcom/asrin/ubuntukose/KoseServis;->dp(F)I

    move-result v7

    iput v7, v6, Landroid/widget/GridLayout$LayoutParams;->width:I

    .line 344
    invoke-virtual {v1, v8, v6}, Landroid/widget/GridLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 329
    .end local v5    # "os":I
    .end local v6    # "lp":Landroid/widget/GridLayout$LayoutParams;
    .end local v8    # "t":Landroid/widget/TextView;
    .end local v9    # "daire":Landroid/graphics/drawable/GradientDrawable;
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    .line 346
    .end local v4    # "i":I
    :cond_3
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v5, -0x2

    invoke-direct {v4, v5, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, v1, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 347
    iput-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->secici:Landroid/view/View;

    .line 348
    iget-object v4, p0, Lcom/asrin/ubuntukose/KoseServis;->wm:Landroid/view/WindowManager;

    const/4 v5, 0x0

    invoke-virtual {p0, v7, v7, v5}, Lcom/asrin/ubuntukose/KoseServis;->katman(IIZ)Landroid/view/WindowManager$LayoutParams;

    move-result-object v5

    invoke-interface {v4, v0, v5}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 349
    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->setAlpha(F)V

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-virtual {v4, v5}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    const-wide/16 v6, 0xa0

    invoke-virtual {v4, v6, v7}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 350
    const v4, 0x3f6b851f    # 0.92f

    invoke-virtual {v1, v4}, Landroid/widget/GridLayout;->setScaleX(F)V

    invoke-virtual {v1, v4}, Landroid/widget/GridLayout;->setScaleY(F)V

    invoke-virtual {v1}, Landroid/widget/GridLayout;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    invoke-virtual {v4, v5}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    invoke-virtual {v4, v5}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    const-wide/16 v5, 0xdc

    invoke-virtual {v4, v5, v6}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    new-instance v5, Landroid/view/animation/OvershootInterpolator;

    const v6, 0x3f99999a    # 1.2f

    invoke-direct {v5, v6}, Landroid/view/animation/OvershootInterpolator;-><init>(F)V

    invoke-virtual {v4, v5}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 351
    return-void

    .line 316
    .end local v0    # "kok":Landroid/widget/FrameLayout;
    .end local v1    # "g":Landroid/widget/GridLayout;
    .end local v2    # "zemin":Landroid/graphics/drawable/GradientDrawable;
    .end local v3    # "su":Ljava/lang/String;
    :cond_4
    :goto_1
    return-void
.end method

.method seciciKapat()V
    .locals 4

    .line 354
    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->secici:Landroid/view/View;

    .local v0, "v":Landroid/view/View;
    if-nez v0, :cond_0

    return-void

    .line 355
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->secici:Landroid/view/View;

    .line 356
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const-wide/16 v2, 0x8c

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    new-instance v2, Lcom/asrin/ubuntukose/KoseServis$$ExternalSyntheticLambda3;

    invoke-direct {v2, p0, v0}, Lcom/asrin/ubuntukose/KoseServis$$ExternalSyntheticLambda3;-><init>(Lcom/asrin/ubuntukose/KoseServis;Landroid/view/View;)V

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 357
    return-void
.end method

.method sistemeGec(I)V
    .locals 17
    .param p1, "os"    # I

    .line 361
    move-object/from16 v12, p0

    iget-object v0, v12, Lcom/asrin/ubuntukose/KoseServis;->perde:Lcom/asrin/ubuntukose/KoseServis$Perde;

    if-nez v0, :cond_2

    iget-object v0, v12, Lcom/asrin/ubuntukose/KoseServis;->wm:Landroid/view/WindowManager;

    if-nez v0, :cond_0

    goto/16 :goto_1

    .line 362
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_1

    iget-object v0, v12, Lcom/asrin/ubuntukose/KoseServis;->wm:Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getCurrentWindowMetrics()Landroid/view/WindowMetrics;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/WindowMetrics;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    goto :goto_0

    :cond_1
    new-instance v0, Landroid/graphics/Rect;

    const/16 v1, 0x438

    const/16 v2, 0x960

    const/4 v3, 0x0

    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    :goto_0
    move-object v13, v0

    .line 363
    .local v13, "b":Landroid/graphics/Rect;
    invoke-virtual {v13}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float v14, v0, v1

    .local v14, "x":F
    invoke-virtual {v13}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    div-float v15, v0, v1

    .line 364
    .local v15, "y":F
    new-instance v11, Lcom/asrin/ubuntukose/KoseServis$Perde;

    move-object v0, v11

    move-object/from16 v1, p0

    move-object/from16 v2, p0

    move/from16 v3, p1

    move v4, v14

    move v5, v15

    move v6, v14

    move v7, v15

    move v8, v14

    move v9, v15

    move v10, v14

    move-object/from16 v16, v13

    move-object v13, v11

    .end local v13    # "b":Landroid/graphics/Rect;
    .local v16, "b":Landroid/graphics/Rect;
    move v11, v15

    invoke-direct/range {v0 .. v11}, Lcom/asrin/ubuntukose/KoseServis$Perde;-><init>(Lcom/asrin/ubuntukose/KoseServis;Landroid/content/Context;IFFFFFFFF)V

    iput-object v13, v12, Lcom/asrin/ubuntukose/KoseServis;->perde:Lcom/asrin/ubuntukose/KoseServis$Perde;

    .line 365
    iget-object v0, v12, Lcom/asrin/ubuntukose/KoseServis;->wm:Landroid/view/WindowManager;

    iget-object v1, v12, Lcom/asrin/ubuntukose/KoseServis;->perde:Lcom/asrin/ubuntukose/KoseServis$Perde;

    const/4 v2, 0x1

    const/4 v3, -0x1

    invoke-virtual {v12, v3, v3, v2}, Lcom/asrin/ubuntukose/KoseServis;->katman(IIZ)Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 366
    iget-object v0, v12, Lcom/asrin/ubuntukose/KoseServis;->perde:Lcom/asrin/ubuntukose/KoseServis$Perde;

    iget-object v1, v12, Lcom/asrin/ubuntukose/KoseServis;->perde:Lcom/asrin/ubuntukose/KoseServis$Perde;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Lcom/asrin/ubuntukose/KoseServis$$ExternalSyntheticLambda7;

    invoke-direct {v2, v1}, Lcom/asrin/ubuntukose/KoseServis$$ExternalSyntheticLambda7;-><init>(Lcom/asrin/ubuntukose/KoseServis$Perde;)V

    invoke-virtual {v0, v2}, Lcom/asrin/ubuntukose/KoseServis$Perde;->post(Ljava/lang/Runnable;)Z

    .line 367
    return-void

    .line 361
    .end local v14    # "x":F
    .end local v15    # "y":F
    .end local v16    # "b":Landroid/graphics/Rect;
    :cond_2
    :goto_1
    return-void
.end method

.method suAnki()Ljava/lang/String;
    .locals 2

    .line 313
    invoke-virtual {p0}, Lcom/asrin/ubuntukose/KoseServis;->iosModu()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/asrin/ubuntukose/KoseServis;->stil(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, "com.termux.x11"

    iget-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->onPaket:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "ubuntu"

    goto :goto_0

    :cond_1
    const-string v0, "android"

    :goto_0
    return-object v0
.end method

.method tutamakAyarla(Lcom/asrin/ubuntukose/KoseServis$Tutamak;ZI)Lcom/asrin/ubuntukose/KoseServis$Tutamak;
    .locals 2
    .param p1, "t"    # Lcom/asrin/ubuntukose/KoseServis$Tutamak;
    .param p2, "acik"    # Z
    .param p3, "hangi"    # I

    .line 195
    if-nez p2, :cond_1

    .line 196
    if-eqz p1, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->wm:Landroid/view/WindowManager;

    invoke-interface {v0, p1}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 197
    :cond_0
    :goto_0
    const/4 v0, 0x0

    return-object v0

    .line 199
    :cond_1
    if-nez p1, :cond_2

    .line 200
    new-instance v0, Lcom/asrin/ubuntukose/KoseServis$Tutamak;

    invoke-direct {v0, p0, p0, p3}, Lcom/asrin/ubuntukose/KoseServis$Tutamak;-><init>(Lcom/asrin/ubuntukose/KoseServis;Landroid/content/Context;I)V

    move-object p1, v0

    .line 201
    invoke-virtual {p1}, Lcom/asrin/ubuntukose/KoseServis$Tutamak;->konumla()V

    .line 202
    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->wm:Landroid/view/WindowManager;

    iget-object v1, p1, Lcom/asrin/ubuntukose/KoseServis$Tutamak;->lp:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v0, p1, v1}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 204
    :cond_2
    return-object p1
.end method

.method tutamaklar()[Lcom/asrin/ubuntukose/KoseServis$Tutamak;
    .locals 3

    .line 80
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/asrin/ubuntukose/KoseServis$Tutamak;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/asrin/ubuntukose/KoseServis;->sol:Lcom/asrin/ubuntukose/KoseServis$Tutamak;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/asrin/ubuntukose/KoseServis;->sag:Lcom/asrin/ubuntukose/KoseServis$Tutamak;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/asrin/ubuntukose/KoseServis;->altSol:Lcom/asrin/ubuntukose/KoseServis$Tutamak;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/asrin/ubuntukose/KoseServis;->altSag:Lcom/asrin/ubuntukose/KoseServis$Tutamak;

    aput-object v2, v0, v1

    return-object v0
.end method

.method tutamaklariKur()V
    .locals 4

    .line 188
    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->sol:Lcom/asrin/ubuntukose/KoseServis$Tutamak;

    iget-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->sp:Landroid/content/SharedPreferences;

    const-string v2, "solAcik"

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/asrin/ubuntukose/KoseServis;->tutamakAyarla(Lcom/asrin/ubuntukose/KoseServis$Tutamak;ZI)Lcom/asrin/ubuntukose/KoseServis$Tutamak;

    move-result-object v0

    iput-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->sol:Lcom/asrin/ubuntukose/KoseServis$Tutamak;

    .line 189
    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->sag:Lcom/asrin/ubuntukose/KoseServis$Tutamak;

    iget-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->sp:Landroid/content/SharedPreferences;

    const-string v2, "sagAcik"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-virtual {p0, v0, v1, v3}, Lcom/asrin/ubuntukose/KoseServis;->tutamakAyarla(Lcom/asrin/ubuntukose/KoseServis$Tutamak;ZI)Lcom/asrin/ubuntukose/KoseServis$Tutamak;

    move-result-object v0

    iput-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->sag:Lcom/asrin/ubuntukose/KoseServis$Tutamak;

    .line 190
    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->altSol:Lcom/asrin/ubuntukose/KoseServis$Tutamak;

    iget-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->sp:Landroid/content/SharedPreferences;

    const-string v2, "altSolAcik"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    const/4 v2, 0x2

    invoke-virtual {p0, v0, v1, v2}, Lcom/asrin/ubuntukose/KoseServis;->tutamakAyarla(Lcom/asrin/ubuntukose/KoseServis$Tutamak;ZI)Lcom/asrin/ubuntukose/KoseServis$Tutamak;

    move-result-object v0

    iput-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->altSol:Lcom/asrin/ubuntukose/KoseServis$Tutamak;

    .line 191
    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->altSag:Lcom/asrin/ubuntukose/KoseServis$Tutamak;

    iget-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->sp:Landroid/content/SharedPreferences;

    const-string v2, "altSagAcik"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    const/4 v2, 0x3

    invoke-virtual {p0, v0, v1, v2}, Lcom/asrin/ubuntukose/KoseServis;->tutamakAyarla(Lcom/asrin/ubuntukose/KoseServis$Tutamak;ZI)Lcom/asrin/ubuntukose/KoseServis$Tutamak;

    move-result-object v0

    iput-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->altSag:Lcom/asrin/ubuntukose/KoseServis$Tutamak;

    .line 192
    return-void
.end method

.method yardimcilariKur()V
    .locals 5

    .line 118
    iget-object v0, p0, Lcom/asrin/ubuntukose/KoseServis;->sp:Landroid/content/SharedPreferences;

    const-string v1, "assistive"

    const-string v2, "0"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "1"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 119
    .local v0, "at":Z
    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/asrin/ubuntukose/KoseServis;->yardimci:Lcom/asrin/ubuntukose/AssistiveTouch;

    if-nez v2, :cond_0

    new-instance v2, Lcom/asrin/ubuntukose/AssistiveTouch;

    invoke-direct {v2, p0}, Lcom/asrin/ubuntukose/AssistiveTouch;-><init>(Lcom/asrin/ubuntukose/KoseServis;)V

    iput-object v2, p0, Lcom/asrin/ubuntukose/KoseServis;->yardimci:Lcom/asrin/ubuntukose/AssistiveTouch;

    iget-object v2, p0, Lcom/asrin/ubuntukose/KoseServis;->yardimci:Lcom/asrin/ubuntukose/AssistiveTouch;

    invoke-virtual {v2}, Lcom/asrin/ubuntukose/AssistiveTouch;->ekle()V

    goto :goto_0

    .line 120
    :cond_0
    if-nez v0, :cond_1

    iget-object v2, p0, Lcom/asrin/ubuntukose/KoseServis;->yardimci:Lcom/asrin/ubuntukose/AssistiveTouch;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/asrin/ubuntukose/KoseServis;->yardimci:Lcom/asrin/ubuntukose/AssistiveTouch;

    invoke-virtual {v2}, Lcom/asrin/ubuntukose/AssistiveTouch;->kaldir()V

    iput-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->yardimci:Lcom/asrin/ubuntukose/AssistiveTouch;

    .line 121
    :cond_1
    :goto_0
    iget-object v2, p0, Lcom/asrin/ubuntukose/KoseServis;->sp:Landroid/content/SharedPreferences;

    const-string v3, "arkaDokun"

    const-string v4, "yok"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    .line 122
    .local v2, "ad":Z
    if-eqz v2, :cond_3

    iget-object v3, p0, Lcom/asrin/ubuntukose/KoseServis;->arkaDokun:Lcom/asrin/ubuntukose/ArkaDokun;

    if-nez v3, :cond_3

    .line 123
    new-instance v1, Lcom/asrin/ubuntukose/ArkaDokun;

    new-instance v3, Lcom/asrin/ubuntukose/KoseServis$$ExternalSyntheticLambda8;

    invoke-direct {v3, p0}, Lcom/asrin/ubuntukose/KoseServis$$ExternalSyntheticLambda8;-><init>(Lcom/asrin/ubuntukose/KoseServis;)V

    invoke-direct {v1, p0, v3}, Lcom/asrin/ubuntukose/ArkaDokun;-><init>(Landroid/content/Context;Ljava/lang/Runnable;)V

    iput-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->arkaDokun:Lcom/asrin/ubuntukose/ArkaDokun;

    .line 127
    const-class v1, Landroid/os/PowerManager;

    invoke-virtual {p0, v1}, Lcom/asrin/ubuntukose/KoseServis;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/PowerManager;

    .line 128
    .local v1, "pm":Landroid/os/PowerManager;
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/os/PowerManager;->isInteractive()Z

    move-result v3

    if-eqz v3, :cond_4

    :cond_2
    iget-object v3, p0, Lcom/asrin/ubuntukose/KoseServis;->arkaDokun:Lcom/asrin/ubuntukose/ArkaDokun;

    invoke-virtual {v3}, Lcom/asrin/ubuntukose/ArkaDokun;->basla()V

    goto :goto_1

    .line 129
    .end local v1    # "pm":Landroid/os/PowerManager;
    :cond_3
    if-nez v2, :cond_4

    iget-object v3, p0, Lcom/asrin/ubuntukose/KoseServis;->arkaDokun:Lcom/asrin/ubuntukose/ArkaDokun;

    if-eqz v3, :cond_4

    iget-object v3, p0, Lcom/asrin/ubuntukose/KoseServis;->arkaDokun:Lcom/asrin/ubuntukose/ArkaDokun;

    invoke-virtual {v3}, Lcom/asrin/ubuntukose/ArkaDokun;->dur()V

    iput-object v1, p0, Lcom/asrin/ubuntukose/KoseServis;->arkaDokun:Lcom/asrin/ubuntukose/ArkaDokun;

    goto :goto_2

    :cond_4
    :goto_1
    nop

    .line 130
    :goto_2
    return-void
.end method

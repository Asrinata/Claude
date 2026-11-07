# Yeniden derleme

1. `apktool d -r -f Kose_2.apk -o dec2` (kaynaklar olduğu gibi kalır)
2. `smali/KoseServis.smali` dosyasını `dec2/smali_classes2/com/asrin/ubuntukose/` içine koy
   (onAccessibilityEvent içinde `X11Tus.olay(this, paket)`, onUnbind içinde `X11Tus.kaldir()` çağrısı var).
3. `apktool b dec2 -o yeni.apk` ve içinden `classes2.dex` dosyasını al.
4. `javac --release 8 -cp android-4.1.1.4.jar -d cls java/com/asrin/ubuntukose/X11Tus.java`
   `java -cp dalvik-dx-16.0.1.jar com.android.dx.command.Main --dex --min-sdk-version=26 --output=classes3.dex cls`
5. `python paketle.py Kose_2.apk k.pem c.der cikti.apk assets/kur.sh=kur.sh classes2.dex=classes2.dex classes3.dex=classes3.dex`

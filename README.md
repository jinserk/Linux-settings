# DebianSetting

<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
    <!-- 나눔 글꼴 매치 설정 -->
    <match target="pattern">
        <test qual="any" name="family">
            <string>serif</string>
        </test>
        <edit name="family" mode="prepend" binding="strong">
            <string>NanumGothic</string>
        </edit>
    </match>
    <match target="pattern">
        <test qual="any" name="family">
            <string>sans-serif</string>
        </test>
        <edit name="family" mode="prepend" binding="strong">
            <string>NanumGothic</string>
        </edit>
    </match>
    <match target="pattern">
        <test qual="any" name="family">
            <string>sans</string>
        </test>
        <edit name="family" mode="prepend" binding="strong">
            <string>NanumGothic</string>
        </edit>
    </match>
    <match target="pattern">
        <test qual="any" name="family">
            <string>monospace</string>
        </test>
        <edit name="family" mode="prepend" binding="strong">
            <string>NanumGothicCoding</string>
        </edit>
    </match>
</fontconfig>


Package: *
Pin: release a=stretch
Pin-Priority: 1100 
 
Package: *
Pin: release a=stretch-updates
Pin-Priority: 650

Package: *
Pin: release a=stretch-backports
Pin-Priority: 600
 
Package: *
Pin: release a=testing
Pin-Priority: 200
 
Package: *
Pin: release a=unstable
Pin-Priority: 100

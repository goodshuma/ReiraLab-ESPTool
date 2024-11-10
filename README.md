# YozoraLaboratory-ESPTool (Adafruit WebSerial ESPTool)

JavaScript package to install firmware on ESP devices via the browser using WebSerial.

WebSerialを使ってブラウザ経由でESPデバイスにファームウェアをインストールするJavaScriptパッケージ。

https://jt-webflash.yozolab.net/

## Used by

- [Adafruit WipperSnapper](https://learn.adafruit.com/quickstart-adafruit-io-wippersnapper)
- [Adafruit CircuitPython Installer](https://circuitpython.org/downloads)

## Local development

### in linux
- Clone this repository.
- Install dependencies with `npm install`
- Run `script/develop`
- Open http://localhost:5004/

### in windows
- Clone this repository.
- Install dependencies with `npm install`
- Run `script/develop.ps1`
- Open http://localhost:5004/

## Origin

<details><summary>Adafruit WebSerial ESPToolの元リポジトリの説明</summary>

This project was originally written by [Melissa LeBlanc-Williams](https://github.com/makermelissa). [Nabu Casa](https://www.nabucasa.com) ported the code over to TypeScript and in March 2022 took over maintenance from Adafruit. In July 2022, the Nabucasa stopped maintaining the project in favor of an official, but very early release of Espressif's [esptool-js](https://github.com/espressif/esptool-js/). Due to the instability of the tool, Adafruit updated their fork with Nabucasa's changes in November 2022 and took over maintenance once again.

A live copy of the tool is hosted here: https://adafruit.github.io/Adafruit_WebSerial_ESPTool/
</details>

## このリポジトリの説明

私のSlimeVRトラッカーFWの更新をより楽にするために見つけ、それ専用に改造したリポジトリです。

あらかじめFWを開発者側で用意しておき、リスト化することで簡単にFWの更新が簡単になります。
もともと[ESPWebTools](https://github.com/esphome/esp-web-tools)で実装予定でしたが、ESP32C3のオンボードシリアルコンバーターが悪さしてアップロードできなかったので[Adafruit_WebSerial_ESPTool](https://github.com/adafruit/Adafruit_WebSerial_ESPTool)を利用しました

## このリポジトリをクローンして、独自のFWを配布したい場合の手引

### まずは配布したいFWのプロジェクトをVSCodeで開きます

PlatformIOの拡張機能アイコンを押し、そのメニューの中からAdvanced/Verbose Uploadを選択すると、一通りビルドが終わったあとにこのようなログが現れるはずです。
![alt text](readme/image-1.png)

このログを見てみると、それぞれ
- 0x0000
    - bootloader.bin
- 0x8000
    - partitions.bin
- 0xe000
    - boot_app0.bin
- 0x10000
    - firmware.bin

という構成になっているのがわかります。
これらをすべての.binを一つのフォルダにまとめ、それがどのFWなのかわかるようにフォルダ名を変更します(例:Firmware/JT-V0.5.0-sfusion-tuned-mbe)

### 次に、config.jsonにてFWのリストを作ります

このリポジトリにあるFirmware/config.jsonを見てもらえばわかると思う...!説明がむずい！めんどくさい！

### リポジトリをGithubにアップロードし、GithubPagesで公開します

これで終わりっ！
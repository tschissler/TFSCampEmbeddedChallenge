# Battleship Embedded
A simple game of Battleship, written in C++ for embedded devices (ESP32).

## Tools
While the code might work with other development tools, it has been created and tested by using VSCode (https://code.visualstudio.com) with the PlatformIO extension (https://platformio.org). For just executing task on the CLI, PlatformIO Core is sufficient (https://docs.platformio.org/en/latest/core/installation.html)

## Using Docker 
If you do not want to install PlatformIO and other needed tools locally, you can use a docker container to run the commands.

```bash
docker run -it -v ${PWD}:/battleship -w /battleship infinitecoding/platformio-for-ci bash
```

## Build and upload firmware to device
To build the project, use

```bash
pio run
```

To upload the firmware to the device, use

```bash
pio run --target upload
```

## Run unit-tests
To allow running unit-tests on a development machine or in a build process, the code is part of a platform independent library. You can use the PlatformIO CLI to execute these tests 

```bash
pio test -e native
```
This requires a locally installed g++ compiler. Alternatively you can execute the tests within a docker container (see above) that comes with all necessary tools.

## Deployment
You might find some helpful scripts in the _deploy folder.

To flash the firmware on the device, the esptool can be used. This is installed together with PlatformIO or can be installed separately by running

```bash
pip install esptool
```

# Embedded Challenge
Team GRUEN

![PlatformIO CI](https://github.com/dichternebel/TFSCampEmbeddedChallenge/workflows/PlatformIO%20CI/badge.svg)

# Unsere Loesung

* Wir nuzten kein Docker, das kann das Team fuer lokales Entwickeln nutzen
* Wir bauen, testen und deployen direkt auf den PI
* Indem wir einen GitHub Runner auf dem PI laufen lassen, der auf eine Action im GitHub Projekt reagiert
* Testfaelle werden als Anhang an den Build gehangen und sind im NUnit Format

## Installation des Agenten auf dem PI
mkdir actions-runner && cd actions-runner
curl -O -L https://github.com/actions/runner/releases/download/v2.274.2/actions-runner-linux-arm-2.274.2.tar.gz
tar xzf ./actions-runner-linux-arm-2.274.2.tar.gz

## TODOs
* Firmware Flash verhindern, wenn ein Test rot war
* CI und CD klarer trennen
* CI vielleicht gar nicht auf dem PI ausfuehren(?)


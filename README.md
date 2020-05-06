README
===========

This is a template of Docker for Cucumber with Chrome-headless.

Cucumber is a tool that supports Behaviour-Driven Development (BDD).
https://cucumber.io/

This project supports Chrome-headless with Selenium(WebDriver). So you can execute e2e testing by actual web browser.

## Execution

The most simple exection is following.

```bash
$ ./qcmb
```

If you need HTML report, you can use below command.

```bash
$ ./qcmb --format html --out report/index.html 
```

When test is failed, Screenshot is caputured automatically to HTML report.

## Other options

```bash
Usage: qcmb [help|clean] [options]
Examples:
    qcmb help
    qcmb clean
    qcmb --Xheadless=false --format html --out report/index.html 

--Xheadless[true|false] It should be 'false', if no-headless is required for debug.
--{cucumber options}
```

## GUI mode for debug

Basically, docker is only support CLI. And chrome-headless is the best option for CI/CD.
But some time you may wont to use GUI mode for debug.

You can realize it for docker with X11 forwarding.

### Preparation for Mac

Install X11 and proxy

```bash
$ brew install socat
$ brew cask install xquartz
```

Eexcute xquartz and open `Xteam` on xquartz.

```bash
open -a XQuartz 
```

Add permision and exec proxy on `Xteam`.

```bash
$ xhost + 
$ socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:/tmp/.X11-unix/X0
```

Execute `qcmb` with `--Xheadless=false` option.

```bash
$ qcmb --Xheadless=false
```


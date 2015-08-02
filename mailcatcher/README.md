# Supported tags and respective `Dockerfile` links

* `latest`, `0.6.1` [(*Dockerfile*)](https://github.com/chadrien/docker/blob/9b2b4126e59c48e95936c2c08568b828a999f7cd/mailcatcher/Dockerfile)
* `0.5.12` [(*Dockerfile*)](https://github.com/chadrien/docker/blob/1726646d81ce423676b4884adaf013d82699be05/mailcatcher/Dockerfile)

# Mailcatcher

Catches mail and serves it through a dream.

MailCatcher runs a super simple SMTP server which catches any message sent to it to display in a web interface. Run mailcatcher, set your favourite app to deliver to smtp://127.0.0.1:1025 instead of your default SMTP server, then check out http://127.0.0.1:1080 to see the mail that's arrived so far.

![mailcatcher logo](http://mailcatcher.me/logo.png)

# How to use this image

```
docker run -p 1025:1025 -p 1080:1080 chadrien/mailcatcher
```

You can then use an SMTP server at `localhost:1025` and access all emails send through that server with a web interface at `http://localhost:1080`
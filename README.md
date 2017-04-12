Before you install this app, you need to have ImageMagick enabled in your environment:

FOR MAC USERS:
```brew install imagemagick```
and then:
```brew install gs```

FOR LINUX USERS:
```sudo apt-get install imagemagick -y```

Once you have this step done, make sure to enable the ```Paperclip.options[:command_path]``` for your specific system (Linux or Mac) and comment out the one that isn't for your system (the other one) in the development.rb file in config/environments.


- Get that nested attributes working
- Front-end!!!! (home page, sign up, login, profile, availability, match show page)

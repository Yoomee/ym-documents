# YmDocuments

ym_documents is a "plugin" for ym_content that allows users to upload documents they can link to from elsewhere

## Installation
ym_documents is for Rails 4 and Ruby 2.1.5 upwards. 
You can add it to your Gemfile with:

```
gem 'ym_documents'
```

Run the bundle command to install it.

After you install ym_documents, you need to run the generator:

```
rails generate ym_documents:install
```

This will copy controllers, models, migrations and tests into your app.

Then run the migrations:

```
rake db:migrate
```

Add the following line to your application.js

```
#= require ym_documents
```

Add the following line to your application.scss

```
*= require ym_documents
```

## Usage
ym_documents uses dragonfly 0.9 as file uploader. If you are using this with ym_content, a 'Documents' tab will appear in the content admin area.

The library can be used without ym_content but you may need to style it yourself (Note: this has not been tested)

Users can upload files and optionally set the file name. When the file is downloaded, it is downloaded with the filename set if present or with its original filename. The filename of the file itself is not changed.

Users can also delete files.

## Future TODOs

- Use a better version of Dragonfly or switch to Paperclip/Carrierwave.
- Allow editing of files 

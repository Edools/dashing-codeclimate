# dashing-codeclimate

Code Climate widget to Shopify Dashing (http://shopify.github.io/dashing/).


##  Setup


- Copy the contents of the *jobs*, *widgets* and *config* folder into the the jobs, widgets and config (maybe you need create it) folders in your dashing project.

- Edit the codeclimate.yml file to configure the repository name and ID. The configuration looks like this:

```yaml
repos:
  repo_name: repo_id
```
- Configure your credencials. It is not recommended add password directly in the configuration files. So, a good solution is to use *dotenv gem* when you are working on development and environment variables for production.

Add it to dashing's development group gemfile:

```ruby
gem 'dotenv'
```

and run `bundle install`.

Now just add your `CODECLIMATE_API_KEY`in the `.env` file. This file should NEVER be versioned.


## Appearance

![image](https://cloud.githubusercontent.com/assets/496442/2893174/b4291044-d545-11e3-8704-84aea97be388.png)


## Adding this widget to your dashboard

Add the following to your *dashboard.erb* file, and adjust the attributes to place it where you want. The *data-id* value is ended by the repository name (same used in codeclimate.yml).

```html
<li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
  <div data-id="codeclimate-RepoName" data-view="Codeclimate" data-title="Edools 1.0 GPA"></div>
</li>
```

## For best viewing

The layout of these widgets is inspired by [Geckoboard](http://geckoboard.com). So, for best viewing is strongly recommended to change the dimensions of standard widgets. To do this, edit the file `assets/application.coffee` for something like:

```coffee
Dashing.widget_base_dimensions ||= [230, 230]
Dashing.numColumns ||= 5
```

## Inspirations

This widgets was inspired by:
- https://gist.github.com/dgehrett/6829168


## Licence

This widget is released under the [MIT License](http://www.opensource.org/licenses/MIT).

# omniauth-demo

Based on the Quinton Wall's [tutorial](http://devcenter.heroku.com/articles/omniauth-and-force-com) and utilizing Richard Vanhook's [omniauth-salesforce](https://github.com/richardvanhook/omniauth-salesforce), this is an update to this popular example running with Rails 3.1.3 with the following gems; oauth2 (0.5.2), omniauth (1.0.2), omniauth-oauth2 (1.0.0), omniauth-salesforce (1.0.3) and httparty (0.8.1).  Thanks to Quinton and Richard for their great work on these projects.  Here are some brief instructions on how to use it;

1. Clone this repo to your development environment.
1. Create _.key_ and _.crt_ files as per this [article](http://www.akadia.com/services/ssh_test_certificate.html).
1. Create the directory _lib/certs_ and copy the _.key_ and _.crt_ files from the previous step to it.
1. Create and then modify _config/omniauth.yml_ as shown below so that it has your Salesforce key and secret, changing the placeholders to your actual key and secret.
1. Start WEBrick with `rails server` while in the root directory of your project.
1. Make sure the Salesforce account to which these keys are related has REST enabled!
1. Use your browser to navigate to `https://localhost:3000/auth/salesforce`.
1. You should be redirected to Salesforce login page, to which you enter your credentials.
1. Approve access by the application.
1. At this point, you should see the dump of the Account information.

## omniauth.yml

````
# simple omniauth.yml configuration file
key: <key>
secret: <secret>
````

Any questions comments, please don't hesitate to get in touch.  The best way is likely to be Twitter @IntellogInc.


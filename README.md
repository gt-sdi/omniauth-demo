# omniauth-demo

Based on the Quinton Wall's [tutorial](http://devcenter.heroku.com/articles/omniauth-and-force-com) and utilizing Richard Vanhook's [omniauth-salesforce](https://github.com/richardvanhook/omniauth-salesforce), this is an update to this popular example running with Rails 3.1.3 with the following gems; oauth2 (0.5.2), omniauth (1.0.2), omniauth-oauth2 (1.0.0), omniauth-salesforce (1.0.3) and httparty (0.8.1).  Thanks to Quinton and Richard for their great work on these projects.  Here are some brief instructions on how to use it;

1. Clone this repo to your development environment.
1. Create _.key_ and _.crt_ files as per this [article](http://www.akadia.com/services/ssh_test_certificate.html).
1. Create the directory _lib/certs_ and copy the _.key_ and _.crt_ files from the previous step to it.
1. Configure WEBrick so it supports [HTTPS](http://en.wikipedia.org/wiki/HTTP_Secure) using this  [article](http://www.nearinfinity.com/blogs/chris_rohr/configuring_webrick_to_use_ssl.html) as a guide.  Don't forget to modify the generic paths so they point to the _.key_ and _.crt_ files you created above. 
1. Create and then modify _config/omniauth.yml_ as shown below so that it has your Salesforce key and secret, changing the placeholders to your actual key and secret.
1. Make sure the Salesforce account to which these keys are related has REST enabled!
1. Start WEBrick with `rails server` while in the root directory of your project.
1. Point browser to `https://localhost:3000`
1. Click 'auth/salesforce' link
1. You should be redirected to Salesforce login page, to which you enter your credentials.
1. Approve access by the application.
1. When returned to the home page, you should now see the Auth token
1. Click on the '/accounts' link.
1. You should see the dump of the Account information.

To see Oauth refresh token in action:

1. Login to Salesforce ... Navigate to 'Administration Setup > Security Controls > Session Settings
1. Set session timeout to shortest (15 min.)
1. Start / restart this demo app ... follow steps 8 - 14 above to get Account data.
1. Wait longer than session timeout (15 min.).
1. Refresh account page. You will get renewed display of account data.
1. Look at server log ... see refresh token flow.

## omniauth.yml

````
# simple omniauth.yml configuration file
key: <key>
secret: <secret>
````

Any questions comments, please don't hesitate to get in touch.  The best way is likely to be Twitter @IntellogInc.


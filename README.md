
Sage Root Continous Deployment
Wordpress # WP Engine or Cloudways + Codeship Continuous Deployment/Delivery

**Important Note:** All assets/files within your repo should be within the root folder. **DO NOT** include `wp-content`, `wp-content\plugins` etc. The deploy script will create all the appropriate folders as needed.

### Codeship Environment Variables For Cloudways

All of the environment variables below are required

|Variable|Description|Required|
| ------------- | ------------- | ------------- |
|**PROD_INSTALL_IP**|IP for production install|:heavy_exclamation_mark:|
|**DEV_INSTALL_IP**|IP for development install|:heavy_exclamation_mark:|
|**REPO_NAME**|(**"theme"** or **"plugin"**) heme repo name (Typically the folder name of the project)|:heavy_exclamation_mark:|
|**SSH_USERNAME**|Username for the SSH connection|:heavy_exclamation_mark:|



### Codeship Environment Variables For WPengine

All of the environment variables below are required

|Variable|Description|Required|
| ------------- | ------------- | ------------- |
|**PROD_INSTALL_IP**|IP for production install|:heavy_exclamation_mark:|
|**DEV_INSTALL_IP**|IP for development install|:heavy_exclamation_mark:|
|**REPO_NAME**|(**"theme"** or **"plugin"**) theme repo name (Typically the folder name of the project)|:heavy_exclamation_mark:|
|**SSH_USERNAME**|Username for the SSH connection|:heavy_exclamation_mark:|


### Codeship Environment Variables For Cloudways

All of the environment variables below are required

|Variable|Description|Required|
| ------------- | ------------- | ------------- |
|**WPE_PROD_INSTALL**|subdomain for production install|:heavy_exclamation_mark:|
|**WPE_DEV_INSTALL**|subdomain for development install|:heavy_exclamation_mark:|
|**REPO_NAME**|(**"theme"** or **"plugin"**) theme repo name (Typically the folder name of the project)|:heavy_exclamation_mark:|
|**PROJECT_TYPE**|Whether to push theme or plugins|:heavy_exclamation_mark:|


### Commit Message Hash Tags
You can customize the actions taken by the deployment script by utilizing the following hashtags within your commit message

## Deployment Instructions (The Script)

The below build script(s) will check out the linchpin build scripts from github and then run the shell script accordingly based on the environment variables.

In the script below you will see this script is specifcally for **master or main** if you wanted to use this for staging you would setup a deployment that targets **develop** specifically.

### Deploying to your pipeline (master|develop)

In order to deploy to your pipeline you can use the following command regardless of master, develop or a custom branch. We are utilizing `https` instead of `SSH` so we can `git clone` the deployment script without requiring authentication.

### Cloudways

```
# load our build script from the repo
git clone --branch "master" --depth 50 https://github.com/PawelDabrowa/wordpress-codeship-continuous-deployment
chmod 555 ./wordpress-codeship-continuous-deployment/deploy-rsync.sh
./wordpress-codeship-continuous-deployment/deploy-rsync.sh
```

### WPengine

```
# load our build script from the repo
git clone --branch "master" --depth 50 https://github.com/PawelDabrowa/wordpress-codeship-continuous-deployment
chmod 555 ./wordpress-codeship-continuous-deployment/deploy-.sh
./wordpress-codeship-continuous-deployment/deploy.sh
```


### What does this repo need

* Tests and Validation
* Peer review
* Complete documentation for usage (setup pipelines, testing etc).

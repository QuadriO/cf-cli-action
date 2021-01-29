# CF CLI Action with MTA (Multiapps) plugin

Deploy to Cloud Foundry and manage your apps and services using the CF CLI easily with this GitHub Action. Based on https://github.com/citizen-of-planet-earth/cf-cli-action.

## Example Workflow

```
name: Deploy MTA to Cloud Foundry

on:
  push:
    branches:
    - master

jobs:
  build:
    runs-on: ubuntu-18.04
    # Build your app here

  deploy:
    runs-on: ubuntu-18.04
    needs: build

    steps:
    - uses: QuadriO/cf-cli-action@v1
      with:
        cf_api: https://api.my-cloud-foundry.com
        cf_username: ${{ secrets.CF_USER }}
        cf_password: ${{ secrets.CF_PASSWORD }}
        cf_org: AwesomeApp
        cf_space: Development
        command: deploy example.mtar -f
```

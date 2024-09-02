# Custom Keycloak themes for React Sample SPA

This repository contains custom Keycloak themes (login, account) build with [Keycloakify](https://keycloakify.dev) Vite-based starter. Currently, customizing emails with React is not possible, and you can use [FreeMarker Java Template Engine](https://freemarker.apache.org/index.html) instead

## Testing themes locally

[Documentation](https://docs.keycloakify.dev/v/v10/testing-your-theme)

## How to customize themes

[Documentation](https://docs.keycloakify.dev/v/v10/customization-strategies)

## Building themes

You need to have Maven installed to build the theme (The `mvn` command must be in the PATH).

-   On macOS: `brew install maven`
-   On Debian/Ubuntu: `sudo apt-get install maven`
-   On Windows: `choco install openjdk` and `choco install maven` (Or download from [here](https://maven.apache.org/download.cgi))

```bash
npm run build-keycloak-theme
```

Note that by default Keycloakify generates multiple .jar files for different versions of Keycloak  
You can customize this behavior, see documentation [here](https://docs.keycloakify.dev/v/v10/targetting-specific-keycloak-versions)

## Project setup

### Install the dependencies

Use `npm` to install the project dependencies:

```bash
npm install
```

### Configure credentials

The Delete Own Account custom feature included into the Account theme requires the Keycloak credentials configuration to be made. The URL, Realm name, and Client ID should be added to `.env` file

To do this, copy the `.env.example` into a new file in the root folder, rename it to `.env`, and replace the values with your Keycloak credentials 

```sh
VITE_KEYCLOAK_URL='YOUR_KEYCLOAK_INSTANCE_URL'
VITE_KEYCLOAK_REALM='YOUR_KEYCLOAK_REALM_NAME'
VITE_KEYCLOAK_CLIENT_ID='YOUR_KEYCLOAK_CLIENT_ID'
```

## Publising releases with GitHub Actions

The Keycloakify starter comes with a generic GitHub Actions workflow that builds the theme and publishes
the jars [as GitHub releases artifacts](https://github.com/keycloakify/keycloakify-starter/releases/tag/v7.0.1)  
To release a new version **just update the `package.json` version and push it**

To enable the workflow go to your GitHub repository, then navigate to:
`Settings` > `Actions` > `Workflow permissions`, select `Read and write permissions`

## Importing custom Keycloak themes

If you use [Bitnami's Keycloak Helm chart](https://github.com/bitnami/charts/tree/main/bitnami/keycloak) you can leverage the initContainers parameter to load your themes

Add this configuration to `values.yaml` file:
```
keycloak:
  initContainers: |
    - name: realm-ext-provider
      image: curlimages/curl
      imagePullPolicy: IfNotPresent
      command:
        - sh
      args:
        - -c
        - |
          # Replace USER, PROJECT, VERSION.    
          curl -L -f -S -o /extensions/keycloakify-starter.jar https://github.com/{USER}/{PROJECT}/releases/{VERSION}/download/keycloak-theme-for-kc-24.jar

      volumeMounts:
        - name: extensions
          mountPath: /extensions

  extraVolumeMounts: |
    - name: extensions
      mountPath: /opt/bitnami/keycloak/providers

  extraVolumes: |
    - name: extensions
      emptyDir: {}
```

<h3>Happy Keycloak themes customizing!</h3>
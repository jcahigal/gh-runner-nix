This docker allow you to configure a repo runner set with nixdkps control.

## Execution

Pending to solve entrypoint issues, so it should be run with "-it" mode:

$ docker run --rm -e "REPO_NAME=<test_repo_name>" -e "TOKEN=<token_from_github>" -it jcahigal/runner-nix:2.317.0

and then:

$ nix-shell --run "./set_up_runner.sh"


## TODO

1. Pinned dependency version on shell.nix


2. To add the runner to the repository in a programaticaly way. 

Steps:
- Created an app with the "Repository permissions" “Administration: Read & Write”
- Generate and Download the Private Key
- Install the App on a Repository
- To generate a JWT for the App
- Used the generated JWT to call the API to get an Application Access Token:
```
curl -i -X POST \
-H "Authorization: Bearer <JWT>" \
-H "Accept: application/vnd.github.v3+json" \
https://api.github.com/app/installations/<Installation Id of your App for the Repo>/access_tokens \
 -d '{"repositories":["name-of-your-repo"]}'
```

- Use the token in the response to call the endpoint to get the registration token for the runner for the repo:
```
curl \
  -X POST \
  -H "Authorization: token <token>" \
  -H "Accept: application/vnd.github.machine-man-preview+json" \
  https://api.github.com/repos/<owner>/<name-of-your-repo>/actions/runners/registration-token
```

- Use the token from the response to call the ./config.sh from the runner

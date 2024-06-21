This docker allow you to configure a repo runner set with nixdkps control.

## Execution

Pending to solve entrypoint issues, so it should be run with "-it mode":

$ docker run --rm -e "REPO_NAME=<test_repo_name>" -e "TOKEN=<token_from_github>" -it jcahigal/runner-nix:2.317.0

and then:

$ nix-shell --run "./set_up_runner.sh"
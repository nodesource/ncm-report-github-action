# NCM Report Github Action

![NodeSource Certification process](https://github.com/nodesource/ncm-report-github-action/workflows/NodeSource%20Certification%20process/badge.svg?event=push)

This action generates and prints a project-wide report of directory risk and
quality of installed or specified packages.

## Inputs

### `token`

_Default_: `<empty>`

**Required** Learn more about obtaining NodeSource service tokens and
configuring permissions [here](https://docs.nodesource.com/ncm_v2/docs#ci-setup).
We recommend you using repository [Secrets](https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets) to store this value and use it in the workflow.

### `long`

_Default_: `no`

**Optional** Set `yes` if you want the report display a list of all modules.

### `compliance`

_Default_: `no`

**Optional** Set `yes` if you want the report only display non-compliant
packages.

### `security`

_Default_: `no`

**Optional** Set `yes` if you want the report only display packages with
vulnerabilities.

### `github_token`

_Default_: `${{ secrets.GITHUB_TOKEN }}`

**Required** Set to pass the internal GitHub Token for NCM to update the check
and make annotations. Use the default value (`${{ secrets.GITHUB_TOKEN }}`), you
don't need to create any token in Secrets for this, GitHub automatically creates
and sets this in the Action context.

### `github_job_name`

_Default_: `<empty>`

**Required** You need to set the same name you set to your job. If not,
annotations will not be able to be included in your PR or RunCheck.

## Example usage

This action can be used in the following scenarios:

* Default report:

```
uses: nodesource/ncm-report-github-action@master
with:
  token: ${{ secrets.NCM_TOKEN }}
  github_token: ${{ secrets.GITHUB_TOKEN }}
  github_job_name: N|S -> NCM Pipeline
```

* Long version of the report:

```
uses: nodesource/ncm-report-github-action@master
with:
  token: ${{ secrets.NCM_TOKEN }}
  long: 'yes'
  github_token: ${{ secrets.GITHUB_TOKEN }}
  github_job_name: N|S -> NCM Pipeline
```

* Report with compliance only informaiton:

```
uses: nodesource/ncm-report-github-action@master
with:
  token: ${{ secrets.NCM_TOKEN }}
  compliance: 'yes'
  github_token: ${{ secrets.GITHUB_TOKEN }}
  github_job_name: N|S -> NCM Pipeline
```

* Report with package vulnerabilities only informaiton:

```
uses: nodesource/ncm-report-github-action@master
with:
  token: ${{ secrets.NCM_TOKEN }}
  compliance: 'yes'
  github_token: ${{ secrets.GITHUB_TOKEN }}
  github_job_name: N|S -> NCM Pipeline
```

To generate the report, `NCM` needs to get your `node_modules` folder to analyze
and compare data, so, you might need to use more actions to get your code inside
the workflow and the dependencies installed. We recommend you using:

```
- uses: actions/checkout@v2
- run: npm install
```

Feel free to check the workflow in `github/workflows/ncm-report.yml` for
reference and real world usage example.

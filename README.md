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

## Example usage

This action can be used in the following scenarios:

* Default report:

```
uses: nodesource/ncm-report-github-action@master
with:
  token: ${{ secrets.NCM_TOKEN }}
```

* Long version of the report:

```
uses: nodesource/ncm-report-github-action@master
with:
  token: ${{ secrets.NCM_TOKEN }}
  long: 'yes'
```

* Report with compliance only informaiton:

```
uses: nodesource/ncm-report-github-action@master
with:
  token: ${{ secrets.NCM_TOKEN }}
  compliance: 'yes'
```

* Report with package vulnerabilities only informaiton:

```
uses: nodesource/ncm-report-github-action@master
with:
  token: ${{ secrets.NCM_TOKEN }}
  compliance: 'yes'
```

To generate the report, `NCM` needs to get your `node_modules` folder to analyze
and compare data, so, you might need to use more actions to get your code inside the
workflow and the dependencies installed. We recommend you using:

```
- uses: actions/checkout@v2
- run: npm install
```

Feel free to check the workflow in `github/workflows/ncm-report.yml` for
reference and real world usage example.

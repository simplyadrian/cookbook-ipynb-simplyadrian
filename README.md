ipython-notebook Cookbook
=========================
This cookbook sets up the IPython notebook server.


Requirements
------------

#### packages

- python
- pip

Attributes
----------

#### ipython-notebook::launch
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['ipython-notebook']['port']</tt></td>
    <td>Number</td>
    <td>Port Number the notebook server will listen on.</td>
    <td>8888</td>
  </tr>
  <tr>
    <td><tt>['ipython-notebook']['ip']</tt></td>
    <td>String</td>
    <td>The IP address the notebook server will listen on.</td>
    <td>127.0.0.1</td>
  </tr>
</table>

Usage
-----
#### Install Only

Just include `ipython-notebook` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "ipython-notebook"
  ]
}
```

#### Install And Launch

Some options needed.

```json
{
  "name":"my_node",
  "ipython-notebook": {
      "port": 8888,
      "ip": "*"
  },
  "run_list": [
    "ipython-notebook",
    "ipython-notebook::launch"
  ]
}
```

Todo
-----
- Make notes directory and clone notebook repo.
- Use supervisor to daemonize

License and Authors
-------------------
Authors: Adrian Herrera

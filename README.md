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
    <td><tt>['ipynb-simplyadrian']['linux_user']</tt></td>
    <td>String</td>
    <td>The user iPython notebook will run under.</td>
    <td>ipynb</td>
  </tr>
  <tr>
    <td><tt>['ipynb-simplyadrian']['linux_group']</tt></td>
    <td>String</td>
    <td>The group iPython notebook will run under.</td>
    <td>ipynb</td>
  </tr>
  <tr>
    <td><tt>['ipynb-simplyadrian']['home_dir']</tt></td>
    <td>String</td>
    <td>The home directory of the iPython notebook user.</td>
    <td>/home/ipynb</td>
  </tr>
  <tr>
    <td><tt>['ipynb-simplyadrian']['notebook_dir']</tt></td>
    <td>String</td>
    <td>The working directory of the iPython notebook process.</td>
    <td>/home/ipynb/notebooks</td>
  </tr>
  <tr>
    <td><tt>['ipynb-simplyadrian']['ip']</tt></td>
    <td>String</td>
    <td>The IP address the notebook server will listen on.</td>
    <td>node['ipaddress']</td>
  </tr>
  <tr>
    <td><tt>['ipynb-simplyadrian']['port']</tt></td>
    <td>Number</td>
    <td>Port Number the notebook server will listen on.</td>
    <td>80</td>
  </tr>
</table>

Usage
-----

#### Install And Launch

Some options needed.

```json
{
  "name":"my_node",
  "ipynb-simplyadrian": {
      "port": 80,
      "ip": node['ipaddress']
  },
  "run_list": [
    "ipynb-simplyadrian"
  ]
}
```

Todo
-----
- clone notebook repo.
- Use supervisor to daemonize

License and Authors
-------------------
Authors: Adrian Herrera

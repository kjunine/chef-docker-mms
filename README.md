# docker-mms-cookbook

TODO: Enter the cookbook description here.

## Supported Platforms

TODO: List your supported platforms.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['docker-mms']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### docker-mms::default

Include `docker-mms` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[docker-mms::default]"
  ]
}
```

## License and Authors

Author:: Daniel Ku (<kjunine@gmail.com>)

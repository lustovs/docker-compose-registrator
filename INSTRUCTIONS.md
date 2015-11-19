# Instructions

## Sections

### Create socket key

`$ ssh-agent bash`

### Get auth socket

```bash
`$ env | grep SSH`
```

The output should be:

```
SSH_AGENT_PID=83253
SSH_AUTH_SOCK=/var/folders/dl/7r91pr491kzb_kyvhs4z0_ww0000gn/T//ssh-sRu8MKR8uvgs/agent.83252
```

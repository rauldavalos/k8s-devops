# SETUP FOR DevOpsShift Nodes

## INSTRUCTIONS
- Update C:\Users\<user>\.ssh\config with new DevOpsShift IP address
- open vscode
- open remote ssh into DevOpsShift
- install vscode extension "Kubernetes" and "YAML"
- Open `DevOpShift` terminal and run the following commands
```
git config --global user.name "<User Name>"
git config --global user.email "<email>@gmail.com"
git config --global user.username "<username>"
mkdir -p ~/.ssh;ssh-keygen -N "" -C "" -f ~/.ssh/git_rsa -t rsa -C "<email>@gmail.com"
cat ~/.ssh/git_rsa.pub
echo -e "\n\
Host github.com\n\
 HostName github.com\n\
 IdentityFile ~/.ssh/git_rsa\n\
" >> ~/.ssh/config
```

### open github https://github.com/settings/keys and add the content of ssh/id_rsa.pub

- connect to git
```
ssh -i .ssh/git_rsa git@github.com
```

### clone repo
```
git clone git@github.com:rauldavalos/k8s-devops.git
```

# DOCS
- https://docs.google.com/presentation/d/1H4JMlZBRoaYTgbfq_oq3_mbij-0qf8Opt9VajIG1KtY/edit#slide=id.g11f6208b4df_0_0

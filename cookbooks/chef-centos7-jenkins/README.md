# chef-centos7-jenkins

TODO: Enter the cookbook description here.

To debug the Jenkins instance:
$ service jenkins status
$ sudo journalctl --> Then search for "jenkins"
  - If you see an error saying jenkins requires a specific java version,
    then run '$java -version' on the kitchen instance to see the version
    of java is set. If that version does not satisfy the jenkins requirement,
    make changes to node attributes on the java cookbook to ensure you have
    the version jenkins requires or higher. Then, you need to set the following
    node attribute: node.default['jenkins']['java'] = {enter path here}.

To view jenkins logs:
$ vim /var/log/jenkins

to view jenkins config file:
$ vim /etc/sysconfig/jenkins

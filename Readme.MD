# For this task I chose  to setup Elastic search, Fluentd, Kibana as the infrastructure to collect all logs from #the web servers pods, in this case I used Nginx & Wordpress   
# To setup full stack of EFK( Elatsicsearch, fluentd, Kibana) on kubernetes please  follow these instructions:
# git clone  https://github.com/Danielnadav/elk.git  
# chmod u+x "install.bash & setup.bash" on your machine.
# run ./install.bash to setup with Helm Elastic search, Kibana, Fluentd.
# run ./setup.bash to install Nginx & Wordpress as pods on the kubernetes cluster.
# login to Elasticsearch server with the details you got from the installtion process, for exemple (kubectl port-forward ) to check the Nginx and Wordpress Webservers logs per server with his idexes
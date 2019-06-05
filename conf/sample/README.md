# Deply new-app 
   
~~~console
$ oc new-app wildfly:latest~. --name mysample
$ oc logs -f bc/mysamplea

// New Version 
$ oc start-build mysample --from-file=sample.war
~~~


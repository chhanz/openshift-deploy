# Deply new-app 
   
~~~console
$ oc new-app wildfly:latest~. --name mysample
$ oc logs -f bc/mysamplea

// New Version 
$ oc start-build mysample --from-file=sample.war
~~~


~~~sh
[root@master sample]# oc new-app wildfly:latest~. --name mysample
--> Found image 05e5cf6 (2 weeks old) in image stream "openshift/wildfly" under tag "latest" for "wildfly:latest"
 
    WildFly 13.0.0.Final
    --------------------
    Platform for building and running JEE applications on WildFly 13.0.0.Final
 
    Tags: builder, wildfly, wildfly13
 
    * A source build using binary input will be created
      * The resulting image will be pushed to image stream tag "mysample:latest"
      * A binary build was created, use 'start-build --from-dir' to trigger a new build
    * This image will be deployed in deployment config "mysample"
    * Port 8080/tcp will be load balanced by service "mysample"
      * Other containers can access this service through the hostname "mysample"
 
--> Creating resources ...
    imagestream.image.openshift.io "mysample" created
    buildconfig.build.openshift.io "mysample" created
    deploymentconfig.apps.openshift.io "mysample" created
    service "mysample" created
--> Success
    Build scheduled, use 'oc logs -f bc/mysample' to track its progress.
    Application is not exposed. You can expose services to the outside world by executing one or more of the commands below:
     'oc expose svc/mysample'
    Run 'oc status' to view your app.
 
[root@master sample]# oc expose svc mysample
route.route.openshift.io/mysample exposed
[root@master sample]# oc get route
NAME       HOST/PORT                                PATH      SERVICES   PORT       TERMINATION   WILDCARD
mysample   mysample-test-project.apps.example.com             mysample   8080-tcp                 None
~~~

![SAMPLE PAGE](/conf/sample/sample.png)

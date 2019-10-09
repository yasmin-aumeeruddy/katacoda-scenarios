## A look at MicroProfile

MicroProfile is a set of industry specifications for developing Cloud-native applications. At its foundation are a small number of Java EE specifications; JAX-RS, CDI and JSON-P, which are then augmented with technologies addressing the needs of Cloud-native applications.

The tutorial code shows example use of MicroProfile Health and Metrics.

### MicroProfile Health

When you started Open Liberty, it wrote out a number of available endpoints. One of those is the health endpoint for the application: http://localhost:9080/health/.

Open the health endpoint in a browser and you should see:

{
  "checks": [
    {
      "data": {
        
      },
      "name": "GreetingServiceReadiness",
      "status": "UP"
    }
  ],
  "status": "UP"
}

The MicroProfile health for this application has an overall "outcome" which is determined by the outcome of any available individual health "checks". If any of those checks are "DOWN" then the overall outcome is considered to be "DOWN".

As well as returning a JSON description of the health outcome, the health endpoint also reflects the outcome in the http response code. An outcome of "UP" returns a 200 OK, whereas an outcome of "DOWN" returns a 503 Service Unavailable. This means the endpoint can be hooked up to Kubernetes liveness or readiness probes to reflect the service availability.

The tutorial application health has one "check". This is implemented in src/main/java/my/demo/health/GreetingReadinessCheck.java, the main code of which looks like:

@Readiness
 @ApplicationScoped
public class GreetingReadinessCheck implements HealthCheck {

    public boolean isReady() {

        // Check the health of dependencies here

        return true;

    }

    @Override
    public HealthCheckResponse call() {
        boolean up = isReady();
        return HealthCheckResponse.named("GreetingServiceReadiness").state(up).build();
    }
}

MicroProfile supports two types of health checks: readiness and liveness. These match the health checks supported by deployment environments like Kubernetes and, indeed, the MicroProfile Health APIs have been designed to integrate perfectly and Kubernetes liveness and readiness probes.

A readiness check will typically check the availability of resources the service requires in order to correctly function (e.g. services it depends on, database connections, etc). The tutorial application has a simple example readiness check which just returns true because this service does not have any other dependencies.

You can implement many checks as part of your service and their outcomes are aggregated at the `/health/ready` endpoint. Liveness checks are aggregated at `/health/live` and all checks are aggregated at `/health`.

Feel free to try each of these endpoints. You'll see there's a default `/health/live` endpoint that always reports as UP.


https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/health/ready

https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/health/live

https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/health


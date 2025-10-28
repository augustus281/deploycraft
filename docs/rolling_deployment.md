# ROLLING DEPLOYMENT

## What are rolling deployments?

Rolling deployments are a software release strategy where new version of an application are incrementally deployed to a subset
of servers or instances. This process allows for a gradual rollout, reducing the risk of widespread issues caused by new release.
Instead of updating all instances at once, a rolling deployment updates a few at a time. This ensures that some instances continue
running the old version while the new version is being deployed.

## How a rolling deployment works

Rolling deployments typically follow these steps:

1. __Preparation__: The new version of the application gets prepared and validated in a staging environment to ensure it is ready for production.

2. __Incremental update__: The deployment starts by updating a small subset of instances, usually one or a few at a time. These instances get taken out of the load balancer pool to avoid serving traffic during the update.

3. __Health checks__: After updating the subset, health checks run to ensure the instances are functioning correctly. This may involve monitoring specific metrics or running automated tests.

4. __Update load balancer__: After the updated instances pass health checks, they’re added back to the load balancer pool.

5. __Repeat__: The process repeats for the next subset of instances until the new version is running on all instances.

## What are rolling deployments in Kubernetes?

In Kubernetes, a rolling deployment is a built-in deployment strategy, facilitated by the Kubernetes deployment controllers. These controllers manage the process of gradually updating the instances of an application. Kubernetes automates many of the manual steps in rolling deployments, making the process more efficient and reliable.

When you deploy a new version of a containerized application, Kubernetes updates a few pods at a time while ensuring that the rest of the application is available to handle traffic. The deployment controller continuously monitors the status of each pod and only updates the next batch if the previous ones pass health checks.

A key feature of Kubernetes rolling deployments is the seamless integration with the cluster’s scaling and self-healing capabilities. Kubernetes can automatically scale the number of pods up or down based on resource use and predefined policies. If any pod fails during the update, Kubernetes can roll back the changes or replace the failed pod, maintaining the application’s desired state.

## Pros and cons of rolling deployments

Here are some of the main advantages of rolling deployments:

1. __Reduced downtime__: Rolling deployments ensure that at least some instances of the application are always running. This minimizes downtime and maintains availability for users.

2. __Incremental rollout__: By updating a few instances at a time, rolling deployments allow for a gradual introduction of the new version. This makes it easier to identify and resolve issues without affecting the entire user base.

3. __Easy monitoring__: The incremental nature of rolling deployments simplifies monitoring and troubleshooting. You can detect problems early, and take corrective measures before they impact more instances.

4. __Continuous deployment__: This method supports continuous deployment practices, as it allows for frequent and smaller updates. This aligns with agile methodologies and DevOps principles.

5. __Resource optimization__: Rolling deployments make efficient use of existing infrastructure, as there is no need to double the environment like in blue/green deployments.

You should also be aware of some important limitations of rolling deployments:

1. __Complex rollback__: Rolling back changes in a rolling deployment can be complex. You need to revert updates on individual instances rather than simply switching environments. This can lead to inconsistencies if not managed carefully.

2. __Longer deployment time__: Since updates happen incrementally, the overall deployment process can take longer compared to strategies like blue/green deployments where the switch is more instantaneous.

3. __Potential for inconsistent states__: During the deployment, different instances may run different versions of the application. This can lead to inconsistent behavior, especially if there are significant changes between versions.

4. __Load balancer configuration__: Continuous updating of load balancer configurations to add or remove instances can introduce complexity and potential points of failure, particularly in large-scale environments.

5. __Higher operational overhead__: The need for constant monitoring, health checks, and incremental updates increases the operational burden on the deployment team. You need robust automation and orchestration tools to manage this effectively.
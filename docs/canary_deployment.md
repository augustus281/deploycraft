# CANARY DEPLOYMENT

## What are canary deployments?

Canary deployments and canary releases are a pattern for rolling out releases to a subset of users or servers. The idea is to first deploy the change to a small subset of servers, test it, and then roll it out to the rest of the servers. The canary deployment serves as an early warning indicator that impacts fewer end users when something goes wrong. If the canary deployment fails, it only impacts users on the subset, while those on the rest of the servers aren’t affected.

## How canary deployments work

As an example, imagine you have an environment with 4 web servers. Rather than deploying to all deployment targets in the environment, a canary deployment would look like this:

1. Deploy to one or more canary servers.

2. Test, or wait until satisfied.

3. Deploy to the remaining servers.

## Canary release versus canary deployment

While the terms “canary release” and “canary deployment” are often used interchangeably, there are subtle differences between them.

A canary release refers to the gradual rollout of new software features or updates to a small subset of users or servers, often in a controlled and monitored environment. The focus of a canary release is primarily on user feedback and the performance of the new feature. This lets you gather real-world usage data, identify potential issues, and make adjustments before a broader release.

A canary deployment encompasses the entire deployment process, including infrastructure changes, configuration updates, and the release of new features. It’s a broader concept that includes both the release phase and monitoring and validation phases. Canary deployments aim to minimize the risk associated with new releases by limiting exposure to potential problems. This makes sure that only a small portion of the user base is affected if an unexpected issue arises.

## Pros and cons of canary deployments

Canary deployments offer several advantages that make them a popular choice for rolling out new features and updates. However, they also have drawbacks you should be aware of.

Here are some of the key benefits:

1. __Risk mitigation__: By deploying changes to a small subset of servers initially, you can find issues and address them before the full rollout, minimizing the impact on users.

2. __Incremental rollouts__: This approach allows gradual exposure to new features, which helps you effectively monitor performance and user feedback.

3. __Real-time feedback__: Canary deployments provide immediate insights into the performance and stability of new releases under real-world conditions.

4. __Flexibility__: You can adjust the deployment process based on performance metrics. This allows for a dynamic rollout that you can pause or roll back as needed.

5. __Cost-effectiveness__: Unlike blue/green deployments, canary deployments don’t require a separate environment, making them more resource-efficient.

Canary deployments also have several important limitations:

1. __Complexity__: Implementing canary deployments requires sophisticated traffic management, monitoring, and automated testing to identify and resolve issues quickly.

2. __Configuration management__: Managing different configurations for canary and full deployments can be challenging, especially in complex environments.

3. __Limited scope__: While useful for detecting issues, canary deployments may not catch all potential problems, particularly those that only manifest under full load

4. __Rollback complexity__: Rolling back changes can be more complex than in blue/green deployments, as it might involve reverting only a subset of servers.

5. __Resource allocation__: Although more resource-efficient than blue/green deployments, canary deployments still require careful planning and resource allocation to manage the different stages of the rollout.

## Reference:

[Canary Deployment](https://octopus.com/devops/software-deployments/canary-deployment/)
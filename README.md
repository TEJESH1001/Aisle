# Aisle
Aisle-Assignment

Project - 1

To handle this situation in a scalable way, the key approach is to use a combination of time zone-aware scheduling and efficient background tasks for refreshing user data. Here's how I would approach the backend logic:

#User Time Zone Handling:
Store each user’s time zone in the database or retrieve it from their profile or device settings.
This allows you to calculate the exact local time for each user when determining when to reset their Likes count.

#Scheduled Job or Task Queue:
Use a job scheduler to trigger a daily task for each user at 12:00 pm local time, based on their time zone.
Instead of calculating the reset times individually for each user, batch them by time zone. For instance, users in the same time zone can have their Likes reset in the same job execution.

#Efficiently Storing and Resetting Likes:
Keep a count of the Likes for each user in a cache. At 12:00 pm local time, reset the Likes count for users by updating the cache or database.
In case of high traffic or heavy load, use background workers to perform this task asynchronously, updating users in smaller batches to avoid performance degradation.

#Data Consistency and Failover:
Implement robust error handling for scenarios where the task fails.
Ensure that the system can recover if something goes wrong during the Likes reset process, and that data consistency is maintained across servers and databases.

#Load Distribution:
Distribute the load by using a scalable system that can handle millions of users, such as partitioning the users by their time zones.

#Real-Time Updates:
After the Likes reset, push updates to users, such as notifying them about their refreshed daily Likes count. This can be done with a push notification.

#iOS App Behavior:
When the user opens the app or receives the push notification, the app checks the backend or local storage to get the updated Likes count.
The app updates the UI to reflect the new number of Likes (reset to 10).

This approach would minimize database load by grouping users based on their local time and time zones while maintaining a scalable and consistent system for resetting Likes daily.

Project - 2

Implelemted the project which is in this repo. Please take a clone or download Zip and verify.

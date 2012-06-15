
library(la)

data(events)
data(scores)

# STEP 2 Show a summary of the data just read

summary(events)
summary(scores)

# STEP 3 Histogram of one column of scores.csv. Try the rest of the columns.

hist(scores$score_1)

# Calculate the mean scores (columns 2 through 8) and add it as an additional 
# column to the data set
scores$average = apply(scores[,c(2:8)], 1, mean)

# STEP 4 Plot the evolution of scores for a student. The first parameter c(1:7)
# is simply to produce x axis with number 1 to 7. The second parameter selects
# the scores (columns 2 through 8) for the student with name 'b0f0aaeff' from the
# scores.csv dataframe. The third parameter says that the plot should be a
# line. Change the value 'b0f0aaeff' to select any other student in the second
# parameter

plot(c(1:7),                                                    # First param.
     as.matrix(scores[scores$user == 'b0f0aaeff',2:8]), # Second param.
     type = "l")                                                # Third param.

# STEP 5 Separate the events by data type by adding one column with a boolean
events$is_forum_post = ifelse(events$event_type == 'forum_post', 1, 0)
events$is_forum_view = ifelse(events$event_type == 'forum_view', 1, 0)
events$is_use_tool_1 = ifelse(events$event_type == 'use_tool_1', 1, 0)
events$is_use_tool_2 = ifelse(events$event_type == 'use_tool_2', 1, 0)
events$is_visit_node = ifelse(events$event_type == 'visit_node', 1, 0)

# STEP 6: create a new data frame where each row is a student and the columns are
# the counts of each event type.

event_counts = aggregate(events[,c('is_forum_post', 'is_forum_view',
                                        'is_use_tool_1', 'is_use_tool_2',
                                        'is_visit_node')], 
                          list(user = events$user), FUN = "sum")

# STEP 7: Merge the scores.csv dataset and the event_counts into one single
# dataset with one student per row and the union of both columns

student_info = merge(scores, event_counts, by.x = "user", by.y = "user")

days = table(ev2[,2])
udays = rep(0,7)
for (i in 1:length(days)) {
  udays[i] = length( which(ev2[,2]==names(days[i]) ))
}

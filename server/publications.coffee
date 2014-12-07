Meteor.publish "posts",(userId) ->
  check userId, String
#  check userId, Match.Any
  Posts.find({})


Meteor.publish "likes",() ->
#  check postId, String
#  check postId, Match.Any
#  Likes.find({post:postId})
  Likes.find({})
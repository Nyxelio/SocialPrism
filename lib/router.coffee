Router.configure {
  progressSpinner : false,
  layoutTemplate: 'main',
  loadingTemplate: 'loading',
#  waitOn: () -> Meteor.subscribe 'posts'
}

Router.route '/', {name: 'splash'}
Router.route '/circles', {name: 'myCircles'}
Router.route '/home'
Router.route '/messages'
Router.route '/photos'
Router.route '/events'
Router.route '/browse'
Router.route '/findfriends'
Router.route('/profile/:_id', {
  name: 'profile',
  data: () -> Users.findOne(this.params._id)
})

requireLogin = () ->
  if !Meteor.user()
    if Meteor.loggingIn()
      @render(@loadingTemplate)
    else @render('splash')
  else @next()

redirectHome = () ->
  if Meteor.user()
    @render('home')
  else @next()


Router.onBeforeAction requireLogin, {except: 'splash'}
Router.onBeforeAction redirectHome, {only: 'splash'}
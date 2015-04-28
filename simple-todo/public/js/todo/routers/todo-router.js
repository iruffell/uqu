/*jshint browser:true */
/*global define:true */
define([
	"backbone",
	"jquery",
	"app-view"
],
function (Backbone, $, appView) {
	"use strict";

	var TodoRouter = Backbone.Router.extend({
		routes: {
			"": "landing",
			"login": "login",
			"list": "list"
		},

		landing: function() {
			// our default behavior is to send them to the list page
			// which will determine if they have access to view the page
			this.navigate("list", { trigger: true });
		},

		login: function() {
			// render the login view
			appView.renderLogin();
		},

		list: function() {
			// make a GET request to session to determine if they're logged in
			$.get("/session").done(function(data) {
				if (data === "true") {
					// they are logged in, render the list view
					appView.renderList();
				} else {
					// they are not logged in
					// send them to the login page
					Backbone.history.navigate("login", { trigger: true });
				}
			}).fail(function() {
				console.error("failed to check status on session!");
				// send them to the login page
				Backbone.history.navigate("login", { trigger: true });
			});
		}
	});

	return TodoRouter;

});
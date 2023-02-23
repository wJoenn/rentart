// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import AosController from "./aos_controller"
application.register("aos", AosController)

import DropdownMenuController from "./dropdown_menu_controller.js"
application.register("dropdown-menu", DropdownMenuController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

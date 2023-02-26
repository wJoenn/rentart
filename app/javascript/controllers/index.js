// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import AosController from "./aos_controller"
application.register("aos", AosController)

import BookingFormPriceController from "./booking_form_price_controller"
application.register("booking-form-price", BookingFormPriceController)

import Carousel from 'stimulus-carousel'
application.register('carousel', Carousel)

import DropdownMenuController from "./dropdown_menu_controller"
application.register("dropdown-menu", DropdownMenuController)

import TypedController from "./typed_controller"
application.register("typed", TypedController)

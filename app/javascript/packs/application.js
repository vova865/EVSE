import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import 'bootstrap'
import '../stylesheets/application'
import '../components/hello_react'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

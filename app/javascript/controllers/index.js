import { application } from "./application"

import PostController from "./post_controller.js"
application.register("post", PostController)

import initMaterialize from "controllers/materialize"

initMaterialize();

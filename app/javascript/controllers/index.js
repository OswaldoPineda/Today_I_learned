import { application } from "controllers/application"

import PostController from "controllers/post_controller"
application.register("post", PostController)

import initMaterialize from "controllers/materialize"

initMaterialize();

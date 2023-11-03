import { application } from 'controllers/application';

import PostController from 'controllers/post_controller';
application.register('post', PostController);

import MaterializeController from 'controllers/materialize_controller';
application.register('materialize', MaterializeController);

import LabelController from 'controllers/label_controller';
application.register('label', LabelController);

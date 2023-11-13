# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin 'stimulus_reflex', to: 'https://ga.jspm.io/npm:stimulus_reflex@3.5.0-pre8/javascript/stimulus_reflex.js', preload: true
pin 'stimulus', to: 'https://ga.jspm.io/npm:stimulus@3.0.1/dist/stimulus.js', preload: true
pin "cable_ready", to: "https://ga.jspm.io/npm:cable_ready@5.0.0-pre9/dist/cable_ready.min.js"
pin "morphdom", to: "https://ga.jspm.io/npm:morphdom@2.6.1/dist/morphdom.js"
pin "@rails/actioncable", to: "https://ga.jspm.io/npm:@rails/actioncable@7.0.3-1/app/assets/javascripts/actioncable.esm.js"
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin "marked", to: "https://ga.jspm.io/npm:marked@4.0.18/lib/marked.esm.js"
pin "trix"
pin "@rails/actiontext", to: "actiontext.js"
pin "clipboard", to: "https://ga.jspm.io/npm:clipboard@2.0.11/dist/clipboard.js"

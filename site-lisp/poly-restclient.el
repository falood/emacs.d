;;; poly-restclient.el --- Popymodes for restclient

(require 'polymode)

(defcustom pm-host/restclient
  (pm-bchunkmode "restclient" :mode 'restclient-mode)
  "Restclient host chunkmode"
  :group 'hostmodes
  :type 'object)

(defcustom  pm-inner/restclient
  (pm-hbtchunkmode "restclient"
                   :mode 'web-mode
                   :head-mode 'host
                   :tail-mode 'host
                   :head-reg "^# <\n"
                   :tail-reg "^# >$")
  "Restclient typical chunk."
  :group 'innermodes
  :type 'object)

(defcustom pm-poly/restclient
  (pm-polymode-one "restclient"
                   :hostmode 'pm-host/restclient
                   :innermode 'pm-inner/restclient)
  "Restclient typical configuration"
  :group 'polymodes
  :type 'object)

;;;###autoload  (autoload 'poly-restclient-mode "poly-restclient")
(define-polymode poly-restclient-mode pm-poly/restclient)

(provide 'poly-restclient)

;display: none;
( search with ack
(global-set-key (kbd "M-F") 'ack)

; close window
(global-set-key (kbd "<f4>") (lambda ()
  (interactive)
  (kill-buffer (current-buffer)
)))

; save buffer
(global-set-key (kbd "M-s") 'save-buffer)

; paste
(global-set-key (kbd "M-v") 'yank)

; undo
(global-set-key (kbd "M-z") 'undo)


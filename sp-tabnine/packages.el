;;; Code:

;;; 声明tabnine这个layer，并安装compnay-tabnine这个库
(defconst sp-tabnine-packages
  '(company-tabnine)
  )

;;; 初始化company-tabnine这个库
(defun sp-tabnine/init-company-tabnine()
  (use-package company-tabnine
    :ensure t
    :defer t
    :init
    :config)
  )

;;; 配置company-tabnine作为company的后端
(defun sp-tabnine/post-init-company-tabnine()
  (with-eval-after-load 'company
    (add-to-list 'company-backends #'company-tabnine)
    )
  )

;;; packages.el ends here


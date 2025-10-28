cat >> /etc/nginx/sites-available/proxy_backend <<EOF

    location / {
        proxy_pass \$backend_url;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;

        # --- LÍNEAS NUEVAS NECESARIAS PARA WEBSOCKET ---
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection "upgrade";
        # -----------------------------------------------
    }
}
EOF

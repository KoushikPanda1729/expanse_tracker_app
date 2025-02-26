package routes

import (
	controller "expanse-tracker/controllers"

	"github.com/gin-gonic/gin"
)

func GoogleAuth(incomingRoutes *gin.Engine) {
	incomingRoutes.GET("/g-login", controller.HandleGoogleLogin)
	incomingRoutes.GET("/g-callback", controller.HandleGoogleCallback)
}

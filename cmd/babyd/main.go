package main

import (
	"os"

	"github.com/babyblockchains/baby/app"
	"github.com/babyblockchains/baby/cmd/babyd/cmd"
	svrcmd "github.com/cosmos/cosmos-sdk/server/cmd"
)

func main() {
	rootCmd, _ := cmd.NewRootCmd()
	if err := svrcmd.Execute(rootCmd, app.DefaultNodeHome); err != nil {
		os.Exit(1)
	}
}

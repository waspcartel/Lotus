package main

import (
	"os"

	"github.com/babyblockchains/lotus/app"
	"github.com/babyblockchains/lotus/cmd/lotusd/cmd"
	svrcmd "github.com/cosmos/cosmos-sdk/server/cmd"
)

func main() {
	rootCmd, _ := cmd.NewRootCmd()
	if err := svrcmd.Execute(rootCmd, app.DefaultNodeHome); err != nil {
		os.Exit(1)
	}
}

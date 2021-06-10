package keeper

import (
	"github.com/babyblockchains/lotus/x/lotus/types"
)

var _ types.QueryServer = Keeper{}

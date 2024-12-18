#!/bin/bash

# Default values
BASE_LAYERS=8
BASE_WIDTH=64
BASE_RANDOMRATIO=0.0
BASE_ADDITIONAL_RANDOM_FEATURES=1
EPOCHS=500
DATASET="EXP"
PROBDIST="n"
NORMLAYERS=1
ACTIVATION="tanh"
LEARNRATE=0.00065
LEARNRATEGIN=0.00035

if [[ "$DATASET" == "EXP" || "$DATASET" == "CEXP" ]]; then
  EPOCHS=500
else
  EPOCHS=200
fi

# Parameter ranges
LAYER_OPTIONS=(4 8 16)
WIDTH_OPTIONS=(32 64 128)
ADDITIONAL_RANDOM_FEATURES_OPTIONS=(1 32 64)
CONV_TYPES=("ginconv" "sageconv" "graphconv")

# Command template
BASE_COMMAND="python3 train_and_eval.py -epochs $EPOCHS -dataset $DATASET -probDist $PROBDIST -normLayers $NORMLAYERS -activation $ACTIVATION -learnRate $LEARNRATE -learnRateGIN $LEARNRATEGIN"

# Iterate over convolution types
for convType in "${CONV_TYPES[@]}"; do
    echo "Running with convType=$convType"

    # Vary layers
    for layers in "${LAYER_OPTIONS[@]}"; do
        echo "  Layers=$layers"
        $BASE_COMMAND -convType $convType -layers $layers -width $BASE_WIDTH -randomRatio $BASE_RANDOMRATIO -additionalRandomFeatures $BASE_ADDITIONAL_RANDOM_FEATURES
    done

    # Vary width
    for width in "${WIDTH_OPTIONS[@]}"; do
        echo "  Width=$width"
        $BASE_COMMAND -convType $convType -layers $BASE_LAYERS -width $width -randomRatio $BASE_RANDOMRATIO -additionalRandomFeatures $BASE_ADDITIONAL_RANDOM_FEATURES
    done

    # Vary additionalRandomFeatures
    for additionalRandomFeatures in "${ADDITIONAL_RANDOM_FEATURES_OPTIONS[@]}"; do
        echo "  AdditionalRandomFeatures=$additionalRandomFeatures"
        $BASE_COMMAND -convType $convType -layers $BASE_LAYERS -width $BASE_WIDTH -randomRatio $BASE_RANDOMRATIO -additionalRandomFeatures $additionalRandomFeatures
    done
done

from keras.models import Sequential
from keras.layers import Dense
from keras.utils import to_categorical
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split

# Load Iris dataset
iris = load_iris()

# Split dataset
X_train, X_test, y_train, y_test = train_test_split(
    iris.data,
    iris.target,
    test_size=0.3,
    random_state=42
)

# One-hot encoding
y_train = to_categorical(y_train, 3)
y_test_cat = to_categorical(y_test, 3)

# Build Feed Forward Neural Network
model = Sequential([
    Dense(10, input_dim=4, activation='relu'),
    Dense(3, activation='softmax')
])

# Compile model
model.compile(
    loss='categorical_crossentropy',
    optimizer='sgd',
    metrics=['accuracy']
)

# Train model
model.fit(
    X_train,
    y_train,
    epochs=50,
    batch_size=10,
    verbose=0
)

# Evaluate model
loss, acc = model.evaluate(X_test, y_test_cat, verbose=0)

# Print accuracy
print(f'Accuracy: {acc * 100:.2f}%')

#!/bin/bash
# Mosquito Mate VR - Quick Start Server
PORT=${1:-8080}

echo "==================================="
echo "  Mosquito Mate VR"
echo "  Serving on http://localhost:$PORT"
echo "==================================="
echo ""
echo "Open in your browser:"
echo "  Desktop: http://localhost:$PORT"
echo "  Mobile:  http://$(hostname 2>/dev/null || ipconfig getifaddr en0 2>/dev/null || echo 'YOUR_IP'):$PORT"
echo ""
echo "For VR: Use a WebXR-compatible browser (Oculus Browser, Chrome, Edge)"
echo "For mobile: Use device orientation for looking, touch & hold to fly"
echo ""
echo "Press Ctrl+C to stop"
echo ""

if command -v python3 &> /dev/null; then
  python3 -m http.server "$PORT"
elif command -v python &> /dev/null; then
  python -m http.server "$PORT"
elif command -v npx &> /dev/null; then
  npx serve . -l "$PORT"
else
  echo "Error: No server found. Install Python 3 or Node.js."
  exit 1
fi

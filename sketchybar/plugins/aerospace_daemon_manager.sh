#!/bin/bash

# Daemon management script for aerospace workspace monitoring

DAEMON_SCRIPT="$CONFIG_DIR/plugins/aerospace_daemon.sh"
DAEMON_PID_FILE="/tmp/sketchybar_aerospace_daemon.pid"

start_daemon() {
    if [ -f "$DAEMON_PID_FILE" ]; then
        PID=$(cat "$DAEMON_PID_FILE")
        if kill -0 "$PID" 2>/dev/null; then
            echo "Daemon already running with PID $PID"
            return 0
        else
            echo "Removing stale PID file"
            rm -f "$DAEMON_PID_FILE"
        fi
    fi
    
    echo "Starting aerospace workspace monitoring daemon..."
    nohup "$DAEMON_SCRIPT" > /dev/null 2>&1 &
    echo "Daemon started with PID $!"
}

stop_daemon() {
    if [ -f "$DAEMON_PID_FILE" ]; then
        PID=$(cat "$DAEMON_PID_FILE")
        if kill -0 "$PID" 2>/dev/null; then
            echo "Stopping daemon with PID $PID"
            kill "$PID"
            rm -f "$DAEMON_PID_FILE"
            echo "Daemon stopped"
        else
            echo "Daemon not running, removing PID file"
            rm -f "$DAEMON_PID_FILE"
        fi
    else
        echo "Daemon not running"
    fi
}

status_daemon() {
    if [ -f "$DAEMON_PID_FILE" ]; then
        PID=$(cat "$DAEMON_PID_FILE")
        if kill -0 "$PID" 2>/dev/null; then
            echo "Daemon running with PID $PID"
            return 0
        else
            echo "Daemon not running (stale PID file)"
            return 1
        fi
    else
        echo "Daemon not running"
        return 1
    fi
}

case "${1:-start}" in
    start)
        start_daemon
        ;;
    stop)
        stop_daemon
        ;;
    restart)
        stop_daemon
        sleep 1
        start_daemon
        ;;
    status)
        status_daemon
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|status}"
        exit 1
        ;;
esac
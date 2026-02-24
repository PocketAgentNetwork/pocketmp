#!/bin/bash

# PocketMP Skill Installer
# Installs skills to your PocketAgent workspace
# Downloads directly from GitHub without cloning

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default installation path
DEFAULT_INSTALL_PATH="$HOME/.openclaw/workspace/skills"

# GitHub raw content base URL
GITHUB_RAW="https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main"
GITHUB_API="https://api.github.com/repos/PocketAgentNetwork/pocketmp/contents"

# Functions
print_usage() {
    echo "Usage: curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- [OPTIONS] <skill-name>"
    echo ""
    echo "Options:"
    echo "  --list              List all available skills"
    echo "  --info <skill>      Show information about a skill"
    echo "  --path <path>       Custom installation path (default: $DEFAULT_INSTALL_PATH)"
    echo "  --remove <skill>    Remove an installed skill"
    echo "  --help              Show this help message"
    echo ""
    echo "Examples:"
    echo "  curl -fsSL ... | bash -s -- web-search"
    echo "  curl -fsSL ... | bash -s -- --path /custom/path web-search"
    echo "  curl -fsSL ... | bash -s -- --list"
    echo "  curl -fsSL ... | bash -s -- --info web-search"
    echo "  curl -fsSL ... | bash -s -- --remove web-search"
}

list_skills() {
    echo -e "${BLUE}📦 Available Skills:${NC}\n"
    
    # Fetch manifest file (single request)
    local manifest=$(curl -fsSL "$GITHUB_RAW/SKILLS.json" 2>/dev/null)
    
    if [ -z "$manifest" ]; then
        echo -e "${RED}Error: Unable to fetch skills list${NC}"
        exit 1
    fi
    
    echo -e "${GREEN}Official Skills:${NC}"
    echo "$manifest" | grep -A 100 '"official"' | grep -B 1 '"description"' | grep '"name"' | sed 's/.*"name": "\(.*\)".*/\1/' | while read -r skill; do
        local desc=$(echo "$manifest" | grep -A 2 "\"name\": \"$skill\"" | grep '"description"' | sed 's/.*"description": "\(.*\)".*/\1/')
        if [ -n "$desc" ]; then
            echo "  • $skill - $desc"
        else
            echo "  • $skill"
        fi
    done
    
    echo ""
    echo -e "${YELLOW}Community Skills:${NC}"
    
    local community_count=$(echo "$manifest" | grep -A 100 '"community"' | grep '"name"' | wc -l | tr -d ' ')
    
    if [ "$community_count" -eq 0 ]; then
        echo "  (No community skills yet - be the first to contribute!)"
    else
        echo "$manifest" | grep -A 100 '"community"' | grep -B 1 '"description"' | grep '"name"' | sed 's/.*"name": "\(.*\)".*/\1/' | while read -r skill; do
            local desc=$(echo "$manifest" | grep -A 2 "\"name\": \"$skill\"" | grep '"description"' | sed 's/.*"description": "\(.*\)".*/\1/')
            if [ -n "$desc" ]; then
                echo "  • $skill - $desc"
            else
                echo "  • $skill"
            fi
        done
    fi
}

show_info() {
    local skill_name=$1
    local skill_type=""
    
    # Check if skill exists in official
    if curl -fsSL "$GITHUB_RAW/official/$skill_name/SKILL.md" 2>/dev/null | head -1 > /dev/null 2>&1; then
        skill_type="official"
        echo -e "${GREEN}Official Skill${NC}"
    elif curl -fsSL "$GITHUB_RAW/community/$skill_name/SKILL.md" 2>/dev/null | head -1 > /dev/null 2>&1; then
        skill_type="community"
        echo -e "${YELLOW}Community Skill${NC}"
    else
        echo -e "${RED}Error: Skill '$skill_name' not found${NC}"
        exit 1
    fi
    
    echo ""
    echo -e "${BLUE}Skill Information:${NC}"
    
    # Fetch and display SKILL.md frontmatter
    curl -fsSL "$GITHUB_RAW/$skill_type/$skill_name/SKILL.md" 2>/dev/null | awk '/^---$/{if(++count==2) exit} count==1 && /^(name|description|author|version|tags):/{print "  " $0}'
    
    echo ""
    echo -e "${BLUE}Files:${NC}"
    curl -fsSL "$GITHUB_API/$skill_type/$skill_name" 2>/dev/null | grep '"name"' | sed 's/.*"name": "\(.*\)".*/  • \1/'
}

install_skill() {
    local skill_name=$1
    local install_path=$2
    local skill_type=""
    
    # Fetch manifest to get skill info
    local manifest=$(curl -fsSL "$GITHUB_RAW/SKILLS.json" 2>/dev/null)
    
    if [ -z "$manifest" ]; then
        echo -e "${RED}Error: Unable to fetch skills manifest${NC}"
        exit 1
    fi
    
    # Check if skill exists in official or community
    if echo "$manifest" | grep -A 100 '"official"' | grep -q "\"name\": \"$skill_name\""; then
        skill_type="official"
    elif echo "$manifest" | grep -A 100 '"community"' | grep -q "\"name\": \"$skill_name\""; then
        skill_type="community"
    else
        echo -e "${RED}Error: Skill '$skill_name' not found${NC}"
        echo ""
        echo "Run with --list to see available skills"
        exit 1
    fi
    
    # Get files list from manifest
    local files=$(echo "$manifest" | grep -A 10 "\"name\": \"$skill_name\"" | grep '"files"' | sed 's/.*"files": \[\(.*\)\].*/\1/' | tr -d '"' | tr ',' '\n')
    
    # Create installation directory if it doesn't exist
    mkdir -p "$install_path"
    
    # Check if skill already exists
    if [ -d "$install_path/$skill_name" ]; then
        echo -e "${YELLOW}Warning: Skill '$skill_name' already exists at $install_path${NC}"
        read -p "Overwrite? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            echo "Installation cancelled."
            exit 0
        fi
        rm -rf "$install_path/$skill_name"
    fi
    
    # Create skill directory
    mkdir -p "$install_path/$skill_name"
    
    echo -e "${BLUE}Installing $skill_type skill: $skill_name${NC}"
    
    # Download each file
    for file in $files; do
        file=$(echo "$file" | tr -d ' ')
        echo "  Downloading $file..."
        curl -fsSL "$GITHUB_RAW/$skill_type/$skill_name/$file" -o "$install_path/$skill_name/$file" 2>/dev/null || {
            echo -e "${RED}Error: Failed to download $file${NC}"
            rm -rf "$install_path/$skill_name"
            exit 1
        }
    done
    
    # Success message
    echo -e "${GREEN}✓ Successfully installed '$skill_name' to $install_path/$skill_name${NC}"
    
    if [ "$skill_type" = "community" ]; then
        echo -e "${YELLOW}Note: This is a community skill. Use at your own discretion.${NC}"
    fi
    
    echo ""
    echo "To use this skill, restart your agent or reload skills."
}

remove_skill() {
    local skill_name=$1
    local install_path=${2:-$DEFAULT_INSTALL_PATH}
    
    # Check if skill exists
    if [ ! -d "$install_path/$skill_name" ]; then
        echo -e "${RED}Error: Skill '$skill_name' not found at $install_path${NC}"
        echo ""
        echo "Installed skills:"
        if [ -d "$install_path" ]; then
            ls -1 "$install_path" 2>/dev/null | sed 's/^/  • /' || echo "  (No skills installed)"
        else
            echo "  (Skills directory does not exist)"
        fi
        exit 1
    fi
    
    # Confirm removal
    echo -e "${YELLOW}Warning: This will permanently remove '$skill_name'${NC}"
    echo "Location: $install_path/$skill_name"
    read -p "Are you sure? (y/N): " -n 1 -r
    echo
    
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Removal cancelled."
        exit 0
    fi
    
    # Remove skill
    rm -rf "$install_path/$skill_name"
    
    echo -e "${GREEN}✓ Successfully removed '$skill_name'${NC}"
    echo ""
    echo "Restart your agent to complete the removal."
}

# Main script
main() {
    local install_path="$DEFAULT_INSTALL_PATH"
    local skill_name=""
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --list)
                list_skills
                exit 0
                ;;
            --info)
                if [ -z "$2" ]; then
                    echo -e "${RED}Error: --info requires a skill name${NC}"
                    exit 1
                fi
                show_info "$2"
                exit 0
                ;;
            --remove)
                if [ -z "$2" ]; then
                    echo -e "${RED}Error: --remove requires a skill name${NC}"
                    exit 1
                fi
                skill_name="$2"
                shift 2
                # Continue parsing for --path option
                while [[ $# -gt 0 ]]; do
                    case $1 in
                        --path)
                            if [ -z "$2" ]; then
                                echo -e "${RED}Error: --path requires a directory${NC}"
                                exit 1
                            fi
                            install_path="$2"
                            shift 2
                            ;;
                        *)
                            echo -e "${RED}Error: Unknown option $1${NC}"
                            exit 1
                            ;;
                    esac
                done
                remove_skill "$skill_name" "$install_path"
                exit 0
                ;;
            --path)
                if [ -z "$2" ]; then
                    echo -e "${RED}Error: --path requires a directory${NC}"
                    exit 1
                fi
                install_path="$2"
                shift 2
                ;;
            --help)
                print_usage
                exit 0
                ;;
            -*)
                echo -e "${RED}Error: Unknown option $1${NC}"
                print_usage
                exit 1
                ;;
            *)
                skill_name="$1"
                shift
                ;;
        esac
    done
    
    # Check if skill name provided
    if [ -z "$skill_name" ]; then
        echo -e "${RED}Error: No skill name provided${NC}"
        echo ""
        print_usage
        exit 1
    fi
    
    # Install the skill
    install_skill "$skill_name" "$install_path"
}

main "$@"
